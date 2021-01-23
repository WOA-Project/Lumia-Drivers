1) place this package in the MSPackages root folder
2) adjust paths in OEMInput as needed
3) run build.cmd
4) mount Flash.vhd

5) Copy \HACK_EFIESP(OSPool)\EFI\Boot\bootaa64.efi to \EFIESP\EFI\Boot\bootaa64.efi

3) Edit BCD in HACK_EFIESP as follows:
   bcdedit /store BCD /set {default} nointegritychecks on
   bcdedit /store BCD /set {default} testsigning on

   bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablebootdebugpolicy   No
   bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablebootorderclean    No
   bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enabledeviceid          No
   bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablemassstorage       No
   bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablerpmbprovisioning  No
   bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablesecurebootpolicy  No
   bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablestartcharge       No
   bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enableresettpm          No

4) Rename \HACK_EFIESP(OSPool)\EFI\Microsoft\Boot\SecureBootPolicy.p7b to \HACK_EFIESP(OSPool)\EFI\Microsoft\Boot\SecureBootPolicy.p7b.bak
5) xcopy /cheriky \HACK_EFIESP(OSPool)\ \VIRT_EFIESP(OSPool)\

6) Mount \Main(OSPool)\Windows\System32\config\SOFTWARE as RTS
7) Import systemcertificates.reg
8) Unload RTS

9) Mount \Main(OSPool)\Windows\System32\config\SYSTEM as RTS
10) Import pilregions.reg
11) Set BindFltr Start value from 2 to 0
12) Unload RTS

13) (Needed?) Copy DEVICES to \OSData(OSPool)\Windows\System32\config

14) Patch Disk using WPinternals.exe -Test (compile using given modified code in group chat)
15) Unmount Flash.vhd

Start of /!\ Warning: after this step, your system may be unusable, and will need a reboot after completion of all bottom steps due to a deadlock bug

16) Mount Flash.vhd as read only using diskmgmt.msc
17) Make note of disk id
18) Run tools\img2ffu.exe -p Microsoft.MSM8994.P6211 -i \\.\PhysicalDriveX (where X is the disk id) -o 10.0.20279.1002 -f Flash.ffu
19) Reboot computer to fix loading issues

End of /!\ Warning