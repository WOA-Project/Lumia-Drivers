## Lumia Drivers BSP - Version 2105.1
**Released:** 05/03/2021 12:00 PM UTC+2

**Quality:** Preview

### Important installation notes

![image](battery.png)

Please make sure your battery is fully charged before installing this driver pack. For most batteries the charge must be 100% as the phone may shutdown during setup if the battery is even at 80% charge.
Make sure battery is charged to 100% before continuing. If this is not the case, reboot your device **now** and charge it in an **Operating System**.

Reminder: if you are using WOA Deployer, **please** do not use the "Force Dual Boot" button, otherwise the setup process
will FAIL.

### Release notes

____________________________________________________________________________________________________________________________


Changelog

- You can now disable double tap to wake in the settings app.
- Addresses an issue in glance where the service might stop when trying to initialize the InteropRPC interface (COREBSPNT #124)
- Adds Icaros ESP camera drivers to the tree, replacing the previous stubs (COREBSPNT #104)
- Addresses an issue where the touch driver checked the wrong registry name for double tap to wake (COREBSPNT #126)
- Addresses an issue where the touch settings app could not change the registry value for double tap to wake (COREBSPNT #126)
- Addresses an issue where some HID collections for the touch driver were not properly registered with the operating system (COREBSPNT #127)
- Addresses an issue where some drivers did not properly respect the DIRID 13 specification (still WIP across the tree) (COREBSPNT #102/103, GH #22/#12)
- General improvements to the Lattice UC120 driver (N/A)
- Addresses an issue where the phone might not register properly cable/charging events (COREBSPNT #128)
- Addresses an issue where charging might be slow when plugging some charger types (COREBSPNT #128)
- Addresses an issue where Cortana Activation did not work (COREBSPNT #125)
- Addresses an issue where connected standby would not register properly due to a non PoFx registered device (digitizer power), replaces the previously stubbed driver with a proper implementation (COREBSPNT #126)
- Addresses an issue where some devices like hapanero had broken touch with recent touch driver updates (COREBSPNT #126)
- Implements keypad support to the digitizer driver (COREBSPNT #126)
- Addresses an issue with broken audio on 8994/2 (COREBSPNT #129)
- Addresses an issue with broken OEMPanel settings on 8994/2 (COREBSPNT #129)
- Changes default settings for glance screen to not show the background by default (COREBSPNT #130)
- Addresses an issue where MTP might have been broken with recent updates (COREBSPNT #131)
- Addresses an issue where the icon for MTP was broken (COREBSPNT #131)
- Adds ARM32 specific definition files for ARMv8.0 devices that only had ARM64 before (COREBSPNT #123)
- Split mobile bridge into sub services (COREBSPNT #102/103, GH #22/#12)
- Fixed 2 crash issues with the GPU driver and Camera AV Stream driver
- Addresses an issue with ARM32 UWP apps not rendering properly
- Addresses an issue with ColorProfile switching from action center puts invalid values in registry, breaking the settings app
- Addresses an issue with Installation might fail with driverupdater when updating an already running system
- Addresses an issue with Audio driver might install bootloop on newer builds
- Addresses an issue with USBFN not working as it should
- Addresses an issue with Touch settings app having an empty section
- Addresses an issue with newer insider builds looping during install
- Addresses an issue with NFC
- Addresses an issue with ColorProfile toggle being grayed out (it's smart enough now so this shouldn't happen ever again)
- Addresses an issue with DPI not changing
- Addresses an issue with Camcore not installing
- Addresses an issue with powersettings not applying
- General refactoring
- Modularized Services for cellular audio and misc.
- Addresses an issue with Conntected Standby
- Addresses an issue with Alarms not functioning properly in standby
- Addresses an issue with Cellular on old builds

____________________________________________________________________________________________________________________________


How to offline update an existing Windows Desktop installation

- Switch the device into mass storage.
- Take note of the drive letter the Windows partition is using, here we will assume it got mounted as I:

- Download [Lumia-Drivers-Full.zip] from https://github.com/WOA-Project/Lumia-Drivers/releases/latest
- Extract said zip file to a folder of your choice, we will assume here we extracted it to C:\UpdatedDrivers
- Download the DriverUpdater utility from https://github.com/WOA-Project/DriverUpdater/releases/latest
- Open a command prompt as administrator, where the driver utility got downloaded

- If your device is a Lumia 950, execute the following command:
  
  DriverUpdater.exe C:\UpdatedDrivers\Lumia-Drivers-XXXX\definitions\Desktop\ARM64\Internal\950.txt C:\UpdatedDrivers\Lumia-Drivers-XXXX\ I:\

- If your device is a Lumia 950 XL, execute the following command:
  
  DriverUpdater.exe C:\UpdatedDrivers\Lumia-Drivers-XXXX\definitions\Desktop\ARM64\Internal\950xl.txt C:\UpdatedDrivers\Lumia-Drivers-XXXX\ I:\

- Reboot the device, the device will now begin PnP setup once again, and hopefully you will be back soon enough to your desktop

____________________________________________________________________________________________________________________________


How to install Windows Desktop on internal Storage

- Please follow the steps detailed at https://woa-project.github.io/LumiaWOA/guides/

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
- Dual SIM devices are unsupported for Cellular, do not expect cellular to work properly on these
- DirectX is unavailable for x86 and amd64 applications
- No VoLTE
- No VoWiFi
- No Cellular data sharing
- Phone Calls require manual provisioning by the user on builds higher than 18363
- Text messages are unavailable on builds higher then 18363
- Microphone level under Settings is stuck at 50%
- Phone may not boot reliably or have random reboots when the battery falls below 50% on certain devices, if all cores are enabled.
  As a workaround, you can run "bcdedit /set numproc 4" to disable the second core cluster

- Some users might end up being unable to send texts on build 18908 and lower. To address this issue, open regedit on
  the device, go to HKLM\SOFTWARE\Microsoft\Messaging\IMEISpecific (or IMSISpecific), right click, go to security
  Tap advanced, tap change owner, in the dialog that opens, enter "Everyone" (without the quotes), tap check names
  press ok, press ok. Tap ALL APPLICATION PACKAGES, select 'full control', do the same for other listed accounts (optionally)
  Apply, and close regedit.

- Cellular is unavailable on builds lower than 16362.
- Some drivers and mainly sensors will not be working on RS3, RS4 and/or RS5. Might vary depending on patch level.
- An APN might be required to specify for some user in order to get cellular data working.

Current issues with glance screen:

When the glance screen times out after the time specified there's a chance the screen won't turn off, this is still needing investigation but the issue can only be two things:
— either the device got out of S0ix and is sleeping at a lower level, because wifi is not connected for example, as a result the glance service is unable to take actions, this is a problem
— or, the glance service is trying to clear the screen, (there's a specific panel driver command to do so), and for some reason this is failing.
This specific issue might take some time to completely iron out.

The following status notifications are not implemented in the port/non functional in the wrapper libraries:
— Battery saver indication
— Ringer indication (vibrate on, silence on)
— Alarm indication
— Detailed text indication
— Notification badges

The following functionality is not implemented:
— Wake glance on single tap

____________________________________________________________________________________________________________________________


Deprecation notice

- Support for Build 18363 has ended, we cannot guarentee anymore that things will continue to work due to ongoing testing being halted.
  18363 and lower are over 3 years old. Please upgrade to 19041 or higher.

- Build 17763 is deprecated and will not boot successfully anymore [<= 18363 is deprecated, see above]
- Volume / Audio switching is broken on 18363 [Won't fix, <= 18363 is deprecated, see above]
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