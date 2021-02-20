@echo off
rmdir /Q /S ..\..\Lumia-Drivers-Release
mkdir ..\..\Lumia-Drivers-Release

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\DEVICE.SOC_QC8994.CITYMAN.zip ..\components\QC8994\Device\DEVICE.SOC_QC8994.CITYMAN
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\DEVICE.SOC_QC8994.TALKMAN.zip ..\components\QC8994\Device\DEVICE.SOC_QC8994.TALKMAN
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\HARDWARE.USB.MMO_USBC.zip ..\components\QC8994\Hardware\HARDWARE.USB.MMO_USBC
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\HARDWARE.CAMERA.MMO_8994.zip ..\components\QC8994\Hardware\HARDWARE.CAMERA.MMO_8994
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\HARDWARE.CAMERA.MMO_8992.zip ..\components\QC8994\Hardware\HARDWARE.CAMERA.MMO_8992
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\GRAPHICS.SOC_QC8994.MMO_DESKTOP.zip ..\components\QC8994\Graphics\GRAPHICS.SOC_QC8994.MMO_DESKTOP
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\OEM.SOC_QC8994.MMO.zip ..\components\QC8994\OEM\OEM.SOC_QC8994.MMO
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\OEM.SOC_QC8994.MMO_MINIMAL.zip ..\components\QC8994\OEM\OEM.SOC_QC8994.MMO_MINIMAL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.8994.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.8994
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.8994_MINIMAL.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.8994_MINIMAL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.8992.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.8992
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.8992_MINIMAL.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.8992_MINIMAL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.BASE.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.BASE
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.BASE_MINIMAL.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.BASE_MINIMAL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.LATE_SOC.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.LATE_SOC
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.MMO.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.MMO
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC8994.MMO_DESKTOP.zip ..\components\QC8994\Platform\PLATFORM.SOC_QC8994.MMO_DESKTOP
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\HARDWARE.INPUT.SYNAPTICS_RMI4_F12_WIN10.zip ..\components\ANYSOC\Hardware\HARDWARE.INPUT.SYNAPTICS_RMI4_F12_WIN10
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.BASE.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.EXTRAS.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.EXTRAS
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.MMO_EXTRAS.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MMO_EXTRAS
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.MOBILE_BRIDGE.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_BRIDGE
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.MOBILE_COMPONENTS.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.MOBILE_RIL.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.MOBILE_RIL_EXTRAS.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_RIL_EXTRAS
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.SD_BOOT_ENABLEMENT_CITYMAN.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.SD_BOOT_ENABLEMENT_CITYMAN
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\SUPPORT.DESKTOP.SD_BOOT_ENABLEMENT_TALKMAN.zip ..\components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.SD_BOOT_ENABLEMENT_TALKMAN

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\Changelog.zip ..\components\ANYSOC\Changelog