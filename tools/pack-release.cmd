@echo off
REM rmdir /Q /S ..\..\Lumia-Drivers-Release
mkdir ..\..\Lumia-Drivers-Release

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\DEVICE.SOC_QC899X.CITYMAN.zip ..\components\QC899X\Device\DEVICE.SOC_QC899X.CITYMAN
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\DEVICE.SOC_QC899X.CITYMAN_DESKTOP.zip ..\components\QC899X\Device\DEVICE.SOC_QC899X.CITYMAN_DESKTOP
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\DEVICE.SOC_QC899X.TALKMAN.zip ..\components\QC899X\Device\DEVICE.SOC_QC899X.TALKMAN
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\DEVICE.SOC_QC899X.TALKMAN_DESKTOP.zip ..\components\QC899X\Device\DEVICE.SOC_QC899X.TALKMAN_DESKTOP
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\HARDWARE.USB.MMO_USBC.zip ..\components\QC899X\Hardware\HARDWARE.USB.MMO_USBC
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\HARDWARE.CAMERA.MMO_8994.zip ..\components\QC899X\Hardware\HARDWARE.CAMERA.MMO_8994
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\HARDWARE.CAMERA.MMO_8992.zip ..\components\QC899X\Hardware\HARDWARE.CAMERA.MMO_8992
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\GRAPHICS.SOC_QC899X.MMO_DESKTOP.zip ..\components\QC899X\Graphics\GRAPHICS.SOC_QC899X.MMO_DESKTOP
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\OEM.SOC_QC899X.MMO.zip ..\components\QC899X\OEM\OEM.SOC_QC899X.MMO
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\OEM.SOC_QC899X.MMO_MINIMAL.zip ..\components\QC899X\OEM\OEM.SOC_QC899X.MMO_MINIMAL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.8994.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.8994
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.8994_MINIMAL.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.8994_MINIMAL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.8992.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.8992
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.8992_MINIMAL.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.8992_MINIMAL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.BASE.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.BASE
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.BASE_MINIMAL.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.BASE_MINIMAL
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.LATE_SOC.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.LATE_SOC
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.MMO.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.MMO
"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\PLATFORM.SOC_QC899X.MMO_DESKTOP.zip ..\components\QC899X\Platform\PLATFORM.SOC_QC899X.MMO_DESKTOP
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