@echo off

\Windows\OEM\SilentProvisionerT.exe

reg add HKLM\Software\Policies\Microsoft\Windows\Appx /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1

REM System apps
powershell -ExecutionPolicy Bypass -File \Windows\OEM\Applications\SPApps.ps1

cmd.exe /c \Windows\OEM\IHVSettingsFirstLogon.cmd

\Windows\OEM\SilentProvisionerT.exe 1