## Lumia Drivers BSP - Version 2103.32
**Released:** 03/10/2021 09:00 PM UTC+1

**Quality:** Interim

### Important installation notes

![image](battery.png)

Please make sure your battery is fully charged before installing this driver pack. For most batteries the charge must be 100% as the phone may shutdown during setup if the battery is even at 80% charge.
Make sure battery is charged to 100% before continuing. If this is not the case, reboot your device **now** and charge it in an **Operating System**.

Reminder: if you are using WOA Deployer, **please** do not use the "Force Dual Boot" button, otherwise the setup process
will FAIL.

### Release notes

____________________________________________________________________________________________________________________________


Changelog

![image](glance.jpg)

- Ported over glance screen. A couple of notes about glance screen in this release:

  Current issues with glance screen:

  - When the glance screen times out after the time specified there's a chance the screen won't turn off, this is still needing investigation but the issue can only be two things:
  — either the device got out of S0ix and is sleeping at a lower level, because wifi is not connected for example, as a result the glance service is unable to take actions, this is a problem
  — or, the glance service is trying to clear the screen, (there's a specific panel driver command to do so), and for some reason this is failing.
  This specific issue might take some time to completely iron out.

  - The following status notifications are not implemented in the port/non functional in the wrapper libraries:
  — Battery saver indication
  — Ringer indication (vibrate on, silence on)
  — Alarm indication
  — Detailed text indication
  — Notification badges

  - The following functionality is not implemented:
  — Wake glance on single tap


  To answer one main question we saw repeated a lot, (we did answer it in the discussion group that you probably want to join)

  - Yes, the clock moves vertically to prevent oled burnin, this feature is absent on OS Glance, which was introduced in Windows 10 Redstone 2, but is present in the old implementation, which is what this port uses

  - Yes, this is the original glance implementation by nokia ported over with wrapper libraries so it would work "fine"

    As a result, this means you do not have the 5 minutes timeout option that OS Glance had with Redstone 2

  - No, this is not the prerelease glance that had application/sdk support. Getting that one working is a bit more difficult, and wouldn't bring much different.

  - Are we thinking about making our own implementation?

    Yes we are kinda, mainly because of the timeout issue, if it doesn't manage to get fixed, we will have to roll our own implementation unfortunately. Also the battery saver indication issue might be tough to fix, currently it is NOP'd in the binary, but we would have to reimplement a windows phone winrt api to wrap this around

    For the other issues, we need to implement such functionality in the wrapper.

  - Syncing the background wallpaper is also a task that needs to be done, and might get tricky.

- Fixed an issue impacting Color Profile toggle functionality in action center
- Improvements to Color Profiles

![image](settings.png)

- General improvements to system applications. System applications are no longer present under the extras section of the settings application but instead can be found according to the following table:

   - Advanced Info => Bluetooth and other devices

   - Touch => Touch

   - Vibration => Notifications

   - USB Function Mode => USB

   - Color Profile => Display

   - Glance Screen => Lockscreen


- A new touch settings app was introduced in this release, but is not yet functional
- Removed the vidstream device from the default usb function configuration, as this could prevent power vetos
- Other general bug fixes

____________________________________________________________________________________________________________________________


How to offline update an existing Windows Desktop installation

- Switch the device into mass storage.
- Take note of the drive letter the Windows partition is using, here we will assume it got mounted as I:

- Download [Lumia-Drivers-Full.zip] from https://github.com/WOA-Project/Lumia-Drivers/releases/latest
- Extract said zip file to a folder of your choice, we will assume here we extracted it to C:\UpdatedDrivers
- Download the DriverUpdater utility from https://github.com/WOA-Project/DriverUpdater/releases/latest
- Open a command prompt as administrator, where the driver utility got downloaded

- If your device is a Lumia 950, execute the following command:
  
  DriverUpdater.exe C:\UpdatedDrivers\Lumia-Drivers-XXXX\definitions\Desktop\Internal\950.txt C:\UpdatedDrivers\Lumia-Drivers-XXXX\ I:\

- If your device is a Lumia 950 XL, execute the following command:
  
  DriverUpdater.exe C:\UpdatedDrivers\Lumia-Drivers-XXXX\definitions\Desktop\Internal\950xl.txt C:\UpdatedDrivers\Lumia-Drivers-XXXX\ I:\

- Reboot the device, the device will now begin PnP setup once again, and hopefully you will be back soon enough to your desktop

____________________________________________________________________________________________________________________________


How to install Windows Desktop on internal Storage

- Please follow the steps detailed at https://woa-project.github.io/LumiaWOA/guides/

____________________________________________________________________________________________________________________________


How to install Windows Desktop on an SD card

- Insert your SD Card
- Install Windows on the SD card like you would on any external storage media (some tools even exist that can do it for you ie Rufus)
- Set TestSigning on the {bootloadersettings} object of BCD on the sd card
- Setup BootShim/Lumia950XlPkg on the phone eMMC like you would on a traditional installation (You can download bootshim from here: https://dev.azure.com/LumiaWoA/Boot%20Shim/_build/results?buildId=174&view=results) (and the UEFI from here: https://github.com/WOA-Project/Lumia950XLPkg/releases)
- Take note of the drive letter the Windows partition is using on the sd card, here we will assume it got mounted as I:

- Download [Lumia-Drivers-Full.zip] from https://github.com/WOA-Project/Lumia-Drivers/releases/latest
- Extract said zip file to a folder of your choice, we will assume here we extracted it to C:\UpdatedDrivers
- Download the DriverUpdater utility from https://github.com/WOA-Project/DriverUpdater/releases/latest
- Open a command prompt as administrator, where the driver utility got downloaded

- If your device is a Lumia 950, execute the following command:
  
  DriverUpdater.exe C:\UpdatedDrivers\Lumia-Drivers-XXXX\definitions\Desktop\SDCard\950.txt C:\UpdatedDrivers\Lumia-Drivers-XXXX\ I:\

- If your device is a Lumia 950 XL, execute the following command:
  
  DriverUpdater.exe C:\UpdatedDrivers\Lumia-Drivers-XXXX\definitions\Desktop\SDCard\950xl.txt C:\UpdatedDrivers\Lumia-Drivers-XXXX\ I:\

- Reboot the device, boot into BootShim, let the UEFI load, and you should be able to boot from SD Card.

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