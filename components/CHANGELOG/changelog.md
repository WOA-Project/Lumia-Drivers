## Lumia Drivers BSP - Version 2102
**Released:** 02/02/2021 10:00 PM UTC+1

**Quality:** Preview

### Important installation notes

![Battery](battery.png)

Please make sure your battery is fully charged before installing this driver pack. For most batteries the charge must be 100% as the phone may shutdown during setup if the battery is even at 80% charge.
Make sure battery is charged to 100% before continuing. If this is not the case, reboot your device **now** and charge it in an **Operating System**.

### Release notes

____________________________________________________________________________________________________________________________


Changelog

- Improved reliability of HDMI out connections, fixed issues related to audio sinking, link negotiation
- Migrated most of the driver base to be DCH(U) compliant
- Fixed an issue with Microphone configuration on the Lumia 950 XL
- Display scaling now defaults to 250% for the Lumia 950 and Lumia 950 XL
- Fixed broken GPS stack
- Improved power management stack
- Introduced a new universal USB function mode application
- Simplified setup process with less hacks
- Device classes and names got streamlined
- Adjusted PoFx settings for greater compatibility with PEP
- Fixed the issue mentioned last year about the incompatibility with MS VC 2013 x64 on insider builds with x64 emulation
- Fixed a few issues with some services generating errors in windows event viewer due to interactive service type being set
- Updated the TyC controller driver to the latest version
- Added support for Windows 10X (10.0.20279.1002)
- Microsoft Edge no longer shows a blackscreen by default
- [UEFI] Fixed reboot problem, thanks for your patience
- [UEFI] Improved CPU core utilization in Windows thanks to ACPI table changes
- [Servicing] Introduced new offline driver tool that works from mass storage

____________________________________________________________________________________________________________________________


How to offline update an existing Windows Desktop installation

- Switch the device into mass storage.
- Take note of the drive letter the Windows partition is using, here we will assume it got mounted as I:

- Download [Source Code (zip)] from https://github.com/WOA-Project/Lumia-Drivers/releases/latest
- Extract said zip file to a folder of your choice, we will assume here we extracted it to C:\UpdatedDrivers
- Download the DriverUpdater utility
- Open a command prompt as administrator, where the driver utility got downloaded

- If your device is a Lumia 950, execute the following command:
  
  DriverUpdater.exe C:\UpdatedDrivers\Lumia-Drivers-XXXX\definitions\950.txt C:\UpdatedDrivers\Lumia-Drivers-XXXX\ I:\

- If your device is a Lumia 950 XL, execute the following command:
  
  DriverUpdater.exe C:\UpdatedDrivers\Lumia-Drivers-XXXX\definitions\950xl.txt C:\UpdatedDrivers\Lumia-Drivers-XXXX\ I:\

- Reboot the device, the device will now begin PnP setup once again, and hopefully you will be back soon enough to your desktop

____________________________________________________________________________________________________________________________


Hardware specific defects

- A considerable amount of Lumia 950 and Lumia 950 XL devices do not work with the HP lapdock properly when using a wired connection

____________________________________________________________________________________________________________________________


General software defects

- Under certain circumstances, the Lumia 950 (''Talkman'') may fail to reboot properly. Shut down the device via other means (Developer Menu / Flash App & THOR2). This happens during Setup, where the device will display a black screen
- Cameras are not available
- Windows Hello Iris Scanner is not available
- Hyper-V is not available
- SD Card Boot is not available
- Battery life is degraded
- GPS stack is not using any sensor for navigation
- Miracast is not functional with many wireless devices, but works fine on Xbox, and Windows 10 computers
- Graphical glitches can be observed with acrylic effects on builds lower or equal than 20100
- Graphical glitches can be observed on shadows
- MTP may fail to start if the device is plugged a second time, stop the NcsdService to fix the issue via task manager
- Dual SIM devices are unsupported, do not expect cellular to work properly on these
- DirectX is unavailable for x86 and amd64 applications
- No VoLTE
- No VoWiFi
- No Cellular data sharing
- 5Ghz WiFi network may not show up properly under certain conditions [NEW known issue, issue is old]
- Phone Calls require manual provisioning by the user on builds higher than 18363
- Text messages are unavailable on builds higher then 18363

____________________________________________________________________________________________________________________________


Deprecation notice

- Support for Build 18363 has ended, we cannot guarentee anymore that things will continue to work due to ongoing testing being halted.
  18363 and lower are over 3 years old. Please upgrade to 19041 or higher.

- Build 17763 is deprecated and will not boot successfully anymore [<= 18363 is deprecated, see above]
- Volume / Audio switching is broken on 18363 [Won't fix, <= 18363 is deprecated, see above]
- Auto rotation is broken on 18363 [Won't fix, <= 18363 is deprecated, see above]
- Auto brightness is broken on 18363 [Won't fix, <= 18363 is deprecated, see above]
- Vibration is broken on 18363 [Won't fix, <= 18363 is deprecated, see above]
- Night light is broken on 18363 [Won't fix, <= 18363 is deprecated, see above]

____________________________________________________________________________________________________________________________


Windows 10 software defects

- Applications do not get installed if the user reboots the device on first boot before completion.
  As a workaround, find the "Second Party Application Provisioner" application in the start menu, right click, run as administrator
- System reset is not supported
- First boot can have bad thermal performance due to Windows initial app installation.
  While leaving the phone plugged in to a wall charger, let it install all applications, all app updates through the store, and OneDrive. Then let the phone cool down

____________________________________________________________________________________________________________________________


Windows 10X software defects

- Vibration is unavailable
- Under certain circumstances, Windows may fail booting on talkman devices when AutoChk runs (repairing drive at boot). If this is your case, let the device reboot a couple of times, or reflash the FFU file til the issue vanishes
- Second Party Apps are not available
- Cellular data is unavailable

____________________________________________________________________________________________________________________________


### Bug reporting

This release is a Preview release. Bug exists and may happen. If you notice a bug not present in the following bug list, please report them on our Telegram Group.

-- WOA-Project Team