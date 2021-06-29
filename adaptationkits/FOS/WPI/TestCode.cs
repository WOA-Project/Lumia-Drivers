// Copyright (c) 2018, Rene Lergner - wpinternals.net - @Heathcliff74xda
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace WPinternals
{
    internal static class TestCode
    {
        internal static async Task Test(System.Threading.SynchronizationContext UIContext)
        {
            // To avoid warnings when there is no code here.
            await Task.Run(() => { });

            // PhoneNotifierViewModel Notifier = new PhoneNotifierViewModel();
            // Notifier.Start();
            // await SwitchModeViewModel.SwitchTo(Notifier, PhoneInterfaces.Lumia_MassStorage);
            // MassStorage MassStorage = (MassStorage)Notifier.CurrentModel;

            //PhoneNotifierViewModel Notifier = new PhoneNotifierViewModel();
            //Notifier.Start();

            //await SwitchModeViewModel.SwitchTo(Notifier, PhoneInterfaces.Lumia_MassStorage);
            //MassStorage MassStorage = (MassStorage)Notifier.CurrentModel;

            MassStorage MassStorage = new MassStorage("\\\\.\\PhysicalDrive2");

            bool GPTChanged = false;
            var GPTChunk = MassStorage.ReadSectors(0, 256);
            var GPT = new GPT(GPTChunk);

            // Now add NV partition
            Partition BACKUP_BS_NV = GPT.GetPartition("BACKUP_BS_NV");
            Partition UEFI_BS_NV;
            if (BACKUP_BS_NV == null)
            {
                BACKUP_BS_NV = GPT.GetPartition("UEFI_BS_NV");
                Guid OriginalPartitionTypeGuid = BACKUP_BS_NV.PartitionTypeGuid;
                Guid OriginalPartitionGuid = BACKUP_BS_NV.PartitionGuid;
                BACKUP_BS_NV.Name = "BACKUP_BS_NV";
                BACKUP_BS_NV.PartitionGuid = Guid.NewGuid();
                BACKUP_BS_NV.PartitionTypeGuid = Guid.NewGuid();
                UEFI_BS_NV = new Partition();
                UEFI_BS_NV.Name = "UEFI_BS_NV";
                UEFI_BS_NV.Attributes = BACKUP_BS_NV.Attributes;
                UEFI_BS_NV.PartitionGuid = OriginalPartitionGuid;
                UEFI_BS_NV.PartitionTypeGuid = OriginalPartitionTypeGuid;
                UEFI_BS_NV.FirstSector = BACKUP_BS_NV.LastSector + 1;
                UEFI_BS_NV.LastSector = UEFI_BS_NV.FirstSector + BACKUP_BS_NV.LastSector - BACKUP_BS_NV.FirstSector;
                GPT.Partitions.Add(UEFI_BS_NV);
                GPTChanged = true;
            }

            Partition IsUnlockedFlag = GPT.GetPartition("IS_UNLOCKED");
            if (IsUnlockedFlag == null)
            {
                IsUnlockedFlag = new Partition();
                IsUnlockedFlag.Name = "IS_UNLOCKED";
                IsUnlockedFlag.Attributes = 0;
                IsUnlockedFlag.PartitionGuid = Guid.NewGuid();
                IsUnlockedFlag.PartitionTypeGuid = Guid.NewGuid();
                IsUnlockedFlag.FirstSector = 0x40;
                IsUnlockedFlag.LastSector = 0x40;
                GPT.Partitions.Add(IsUnlockedFlag);
                GPTChanged = true;
            }

            if (GPTChanged)
            {
                GPT.Rebuild();
                MassStorage.WriteSectors(0, GPTChunk);
            }

            Partition TargetPartition = GPT.GetPartition("UEFI_BS_NV");
            string SBRes = "WPinternals.SB";
            var streamdata = new SeekableStream(() =>
            {
                var assembly = System.Reflection.Assembly.GetExecutingAssembly();

                // Magic!
                // The SB(A) resource is a compressed version of a raw NV-variable-partition.
                // In this partition the SecureBoot variable is disabled.
                // It overwrites the variable in a different NV-partition than where this variable is stored usually.
                // This normally leads to endless-loops when the NV-variables are enumerated.
                // But the partition contains an extra hack to break out the endless loops.
                var stream = assembly.GetManifestResourceStream(SBRes);

                return new DecompressedStream(stream);
            });

            MassStorage.WriteSectors((UInt32)TargetPartition.FirstSector, new BinaryReader(streamdata).ReadBytes((int)streamdata.Length));
            LogFile.Log("Phone is unlocked!", LogType.FileAndConsole);
        }

        internal static async Task RecoverBadGPT(string GPTPath, string LoadersPath)
        {
            byte[] GPT = File.ReadAllBytes(GPTPath);

            PhoneNotifierViewModel PhoneNotifier = new PhoneNotifierViewModel();
            PhoneNotifier.Start();
            await SwitchModeViewModel.SwitchTo(PhoneNotifier, PhoneInterfaces.Qualcomm_Download);

            byte[] RootKeyHash = null;
            if (PhoneNotifier.CurrentInterface == PhoneInterfaces.Qualcomm_Download)
            {
                QualcommDownload Download2 = new QualcommDownload((QualcommSerial)PhoneNotifier.CurrentModel);
                RootKeyHash = Download2.GetRKH();
            }

            List<QualcommPartition> PossibleLoaders = null;
            if (PhoneNotifier.CurrentInterface == PhoneInterfaces.Qualcomm_Download)
            {
                try
                {
                    PossibleLoaders = QualcommLoaders.GetPossibleLoadersForRootKeyHash(LoadersPath, RootKeyHash);
                    if (PossibleLoaders.Count == 0)
                    {
                        throw new Exception("Error: No matching loaders found for RootKeyHash.");
                    }
                }
                catch (Exception Ex)
                {
                    LogFile.LogException(Ex);
                    throw new Exception("Error: Unexpected error during scanning for loaders.");
                }
            }

            QualcommSerial Serial = (QualcommSerial)PhoneNotifier.CurrentModel;
            QualcommDownload Download = new QualcommDownload(Serial);
            if (Download.IsAlive())
            {
                int Attempt = 1;
                bool Result = false;
                foreach (QualcommPartition Loader in PossibleLoaders)
                {
                    LogFile.Log("Attempt " + Attempt.ToString(), LogType.ConsoleOnly);

                    try
                    {
                        Download.SendToPhoneMemory(0x2A000000, Loader.Binary);
                        Download.StartBootloader(0x2A000000);
                        Result = true;
                        LogFile.Log("Loader sent successfully", LogType.ConsoleOnly);
                    }
                    catch { }

                    if (Result)
                        break;

                    Attempt++;
                }
                Serial.Close();

                if (!Result)
                    LogFile.Log("Loader failed", LogType.ConsoleOnly);
            }
            else
            {
                LogFile.Log("Failed to communicate to Qualcomm Emergency Download mode", LogType.ConsoleOnly);
                throw new BadConnectionException();
            }

            if (PhoneNotifier.CurrentInterface != PhoneInterfaces.Qualcomm_Flash)
                await PhoneNotifier.WaitForArrival();
            if (PhoneNotifier.CurrentInterface != PhoneInterfaces.Qualcomm_Flash)
                throw new WPinternalsException("Phone failed to switch to emergency flash mode.");

            // Flash bootloader
            QualcommSerial Serial2 = (QualcommSerial)PhoneNotifier.CurrentModel;
            Serial2.EncodeCommands = false;

            QualcommFlasher Flasher = new QualcommFlasher(Serial2);

            Flasher.Hello();
            Flasher.SetSecurityMode(0);
            Flasher.OpenPartition(0x21);

            LogFile.Log("Partition opened.", LogType.ConsoleOnly);

            LogFile.Log("Flash GPT at 0x" + ((UInt32)0x200).ToString("X8"), LogType.ConsoleOnly);
            Flasher.Flash(0x200, GPT, 0, 0x41FF); // Bad bounds-check in the flash-loader prohibits to write the last byte.

            Flasher.ClosePartition();

            LogFile.Log("Partition closed. Flashing ready. Rebooting.");

            Flasher.Reboot();

            Flasher.CloseSerial();
        }

        internal static async Task RewriteGPT(string GPTPath)
        {
            PhoneNotifierViewModel Notifier = new PhoneNotifierViewModel();
            Notifier.Start();
            await SwitchModeViewModel.SwitchTo(Notifier, PhoneInterfaces.Lumia_MassStorage);
            MassStorage MassStorage = (MassStorage)Notifier.CurrentModel;

            LogFile.Log("Writing GPT to the device.", LogType.ConsoleOnly);
            MassStorage.WriteSectors(1, GPTPath);
        }

        internal static async Task RewriteMBRGPT()
        {
            FFU FFU = new FFU(@"E:\Device Backups\Alpha\9200_1230.0025.9200.9825\RX100_9825.ffu");
            string GPTPath = @"E:\Device Backups\Alpha\9200_1230.0025.9200.9825\CorrectGPT.bin";

            PhoneNotifierViewModel Notifier = new PhoneNotifierViewModel();
            Notifier.Start();
            await SwitchModeViewModel.SwitchTo(Notifier, PhoneInterfaces.Lumia_MassStorage);
            MassStorage MassStorage = (MassStorage)Notifier.CurrentModel;

            byte[] MBR = FFU.GetSectors(0, 1);
            LogFile.Log("Writing MBR to the device.", LogType.ConsoleOnly);
            MassStorage.WriteSectors(0, MBR);

            LogFile.Log("Writing GPT to the device.", LogType.ConsoleOnly);
            MassStorage.WriteSectors(1, GPTPath);
        }

        internal static async Task RewriteParts(string PartPath)
        {
            PhoneNotifierViewModel Notifier = new PhoneNotifierViewModel();
            Notifier.Start();
            await SwitchModeViewModel.SwitchTo(Notifier, PhoneInterfaces.Lumia_MassStorage);
            MassStorage MassStorage = (MassStorage)Notifier.CurrentModel;

            foreach (var part in Directory.EnumerateFiles(PartPath))
            {
                var partname = part.Split('\\').Last().Replace(".img", "");
                try
                {
                    LogFile.Log($"Writing {partname} to the device.", LogType.ConsoleOnly);

                    LogFile.Log("", LogType.ConsoleOnly);

                    MassStorage.RestorePartition(part, partname, (v, t) =>
                    {
                        LogFile.Log("Progress: " + v + "%", LogType.ConsoleOnly);
                    });
                    LogFile.Log("", LogType.ConsoleOnly);
                }
                catch
                {
                    LogFile.Log("", LogType.ConsoleOnly);
                    LogFile.Log($"Failed writing {partname} to the device.", LogType.ConsoleOnly);
                };
            }
        }

        internal static void PatchImg(string dump)
        {
            using (var fil = File.Open(dump, FileMode.Open))
            {
                byte[] gptbuffer = new byte[0x4200];

                fil.Seek(0x200, SeekOrigin.Begin);
                fil.Read(gptbuffer, 0, 0x4200);

                uint BackupLBA = ByteOperations.ReadUInt32(gptbuffer, 0x20);
                uint LastUsableLBA = ByteOperations.ReadUInt32(gptbuffer, 0x30);

                LogFile.Log("Previous BackupLBA: " + BackupLBA, LogType.ConsoleOnly);
                LogFile.Log("Previous LastUsableLBA: " + LastUsableLBA, LogType.ConsoleOnly);

                uint NewBackupLBA = 62078975u;
                uint NewLastUsableLBA = 62078942u;

                ByteOperations.WriteUInt32(gptbuffer, 0x20, NewBackupLBA);
                ByteOperations.WriteUInt32(gptbuffer, 0x30, NewLastUsableLBA);

                uint HeaderSize = ByteOperations.ReadUInt32(gptbuffer, 0x0C);
                uint PrevCRC = ByteOperations.ReadUInt32(gptbuffer, 0x10);

                LogFile.Log("Previous CRC: " + PrevCRC, LogType.ConsoleOnly);

                ByteOperations.WriteUInt32(gptbuffer, 0x10, 0);
                uint NewCRC = ByteOperations.CRC32(gptbuffer, 0, HeaderSize);

                LogFile.Log("New CRC: " + NewCRC, LogType.ConsoleOnly);

                ByteOperations.WriteUInt32(gptbuffer, 0x10, NewCRC);

                LogFile.Log("Writing", LogType.ConsoleOnly);

                fil.Seek(0x200, SeekOrigin.Begin);
                fil.Write(gptbuffer, 0, 0x4200);

                LogFile.Log("Done!", LogType.ConsoleOnly);
            }
        }

        internal static async Task TestProgrammer(System.Threading.SynchronizationContext UIContext, string ProgrammerPath)
        {
            LogFile.BeginAction("TestProgrammer");
            try
            {
                LogFile.Log("Starting Firehose Test", LogType.FileAndConsole);

                PhoneNotifierViewModel Notifier = new PhoneNotifierViewModel();
                UIContext.Send(s => Notifier.Start(), null);
                if (Notifier.CurrentInterface == PhoneInterfaces.Qualcomm_Download)
                    LogFile.Log("Phone found in emergency mode", LogType.FileAndConsole);
                else
                {
                    LogFile.Log("Phone needs to be switched to emergency mode.", LogType.FileAndConsole);
                    await SwitchModeViewModel.SwitchTo(Notifier, PhoneInterfaces.Lumia_Flash);
                    PhoneInfo Info = ((NokiaFlashModel)Notifier.CurrentModel).ReadPhoneInfo();
                    Info.Log(LogType.ConsoleOnly);
                    await SwitchModeViewModel.SwitchTo(Notifier, PhoneInterfaces.Qualcomm_Download);
                    if (Notifier.CurrentInterface != PhoneInterfaces.Qualcomm_Download)
                        throw new WPinternalsException("Switching mode failed.", "Could not switch the phone to Qualcomm Emergency 9008.");
                    LogFile.Log("Phone is in emergency mode.", LogType.FileAndConsole);
                }

                // Send and start programmer
                QualcommSerial Serial = (QualcommSerial)Notifier.CurrentModel;
                QualcommSahara Sahara = new QualcommSahara(Serial);

                if (await Sahara.Reset(ProgrammerPath))
                    LogFile.Log("Emergency programmer test succeeded", LogType.FileAndConsole);
                else
                    LogFile.Log("Emergency programmer test failed", LogType.FileAndConsole);
            }
            catch (Exception Ex)
            {
                LogFile.LogException(Ex);
            }
            finally
            {
                LogFile.EndAction("TestProgrammer");
            }
        }
    }
}
