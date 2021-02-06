@echo off

reg query HKLM\Software\OEM /v OOBEProvisioningPhaseCompleted | find "0x2"
if errorlevel 1 goto SecondCheck
goto OOBEProvisioningPhaseNoReboot

:SecondCheck
reg query HKLM\Software\OEM /v OOBEProvisioningPhaseCompleted | find "0x1"
if errorlevel 1 goto OOBEProvisioningPhase
goto Continue

:OOBEProvisioningPhase
for /f %%f in ('dir /b /s \Windows\OEM\Setup\OOBE\*.cmd') do (
    cmd.exe /c %%f
)
reg add HKLM\Software\OEM /v OOBEProvisioningPhaseCompleted /t REG_DWORD /d 1 /f
timeout 3
shutdown /r /t 0 /f
timeout 30
goto Continue

:OOBEProvisioningPhaseNoReboot
for /f %%f in ('dir /b /s \Windows\OEM\Setup\OOBE\*.cmd') do (
    cmd.exe /c %%f
)
reg add HKLM\Software\OEM /v OOBEProvisioningPhaseCompleted /t REG_DWORD /d 1 /f
goto Continue

:Continue