1) place this package in the MSPackages root folder
2) adjust paths in OEMInput as needed
3) run build.cmd
4) mount Flash.vhd

5) Copy \HACK_EFIESP(OSPool)\EFI\Boot\bootaa64.efi to \EFIESP\EFI\Boot\bootaa64.efi

3) Edit BCD in HACK_EFIESP as follows:
   bcdedit /store BCD /set {default} dbgtransport kdusb.dll
   bcdedit /store BCD /set {default} nointegritychecks on
   bcdedit /store BCD /set {default} testsigning on
   for the mobilestartup guid, set every option that isn't custom: to no, except for ffuloader and iuloader
4) xcopy /cheriky \HACK_EFIESP(OSPool)\ \VIRT_EFIESP(OSPool)\
5) Copy files from \BSP(OSPool)\Windows\System32\*.* to \Main(OSPool)\Windows\System32\ and  \Data(OSPool)\Windows\System32\
6) Copy files from \BSP(OSPool)\Windows\SysArm32\*.* to \Main(OSPool)\Windows\System32\ and  \Data(OSPool)\Windows\SysArm32\
7) Copy files from \BSP(OSPool)\Windows\System32\Drivers\*.* (where *.* is not a .sys) to \Main(OSPool)\Windows\System32\Drivers and  \Data(OSPool)\Windows\System32\Drivers

8) Mount \Main(OSPool)\Windows\System32\config\SOFTWARE as RTS
9) Set HKLM\RTS\Microsoft\ModernUX\Product OverrideLayoutConfigurators dword:1
10) Unload RTS
11) Mount \Main(OSPool)\Windows\System32\config\SYSTEM as RTS
12) Import pilregions.reg
13) Set HKLM\RTS\ControlSet001\Control\GraphicsDrivers\BasicDisplay DisableBasicDisplayFallback dword:0
14) Unload RTS

15) Patch Disk using WPinternals.exe -Test (compile using given modified code in group chat)
16) Unmount Flash.vhd

/!\ Warning: after this step, your system may be unusable, and will need a reboot after completion of all bottom steps due to a deadlock bug
17) Mount Flash.vhd as read only using diskmgmt.msc
18) Make note of disk id
19) Run tools\img2ffu.exe -p Microsoft.MSM8994.P6211 -i \\.\PhysicalDriveX (where X is the disk id) -o 10.0.20279.1002 -f Flash.ffu
20) Reboot computer to fix loading issues
21) Flash ffu file
22) Prepare WinDbg to attach to kernel (TARGETNAME:WOATARGET)
23) Thank you for upgrading from 15254 to 20279*
* Bugs may get fixed at a later time by you, or someone else

Windows Boot Application (1020000a)
-----------------------------------
identifier              {01de5a27-8705-40db-bad6-96fa5187d4a6}
device                  partition=J:
path                    \windows\system32\boot\mobilestartup.efi
description             Mobile Startup App
inherit                 {bootloadersettings}
recoverysequence        {311b88b5-9b30-491d-bad9-167ca3e2d417}
recoveryenabled         Yes
enablebootdebugpolicy   Yes
enablebootorderclean    Yes
enabledeviceid          Yes
enableffuloader         Yes
enableiuloader          Yes
enablemassstorage       Yes
enablerpmbprovisioning  Yes
enablesecurebootpolicy  Yes
enablestartcharge       Yes
enableresettpm          Yes
custom:26000207         Yes


bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablebootdebugpolicy   No
bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablebootorderclean    No
bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enabledeviceid          No
bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablemassstorage       No
bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablerpmbprovisioning  No
bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablesecurebootpolicy  No
bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablestartcharge       No
bcdedit /store BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enableresettpm          No
