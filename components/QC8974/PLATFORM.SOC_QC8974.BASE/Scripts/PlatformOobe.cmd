@echo off
  
REM Additional power plan settings
REM Windows By Default thinks this platform is not a mobile device,
REM So it treats the power button as a normal power button, 
REM which engages shutdown and does not lock the device

POWERCFG /setdcvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 60
POWERCFG /setacvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 60

POWERCFG /setdcvalueindex SCHEME_CURRENT SUB_SLEEP HYBRIDSLEEP Off
POWERCFG /setacvalueindex SCHEME_CURRENT SUB_SLEEP HYBRIDSLEEP Off

POWERCFG /setdcvalueindex SCHEME_CURRENT SUB_SLEEP HIBERNATEIDLE 0
POWERCFG /setacvalueindex SCHEME_CURRENT SUB_SLEEP HIBERNATEIDLE 0

POWERCFG /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 1
POWERCFG /setacvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 1

POWERCFG /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS PBUTTONACTION 1
POWERCFG /setacvalueindex SCHEME_CURRENT SUB_BUTTONS PBUTTONACTION 1

POWERCFG /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS SBUTTONACTION 1
POWERCFG /setacvalueindex SCHEME_CURRENT SUB_BUTTONS SBUTTONACTION 1

POWERCFG /setdcvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE 60
POWERCFG /setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE 60

POWERCFG /setdcvalueindex SCHEME_CURRENT SUB_VIDEO ADAPTBRIGHT On
POWERCFG /setacvalueindex SCHEME_CURRENT SUB_VIDEO ADAPTBRIGHT On

REM Disable WinRE (Unsupported scenario)
reagentc.exe /disable

REM Battery slider (Disabled temporarily)

REM powercfg /setdcvalueindex OVERLAY_SCHEME_HIGH SUB_PROCESSOR PERFEPP 50
REM powercfg /setacvalueindex OVERLAY_SCHEME_HIGH SUB_PROCESSOR PERFEPP 33
REM powercfg /setdcvalueindex OVERLAY_SCHEME_MAX SUB_PROCESSOR PERFEPP 33
REM powercfg /setacvalueindex OVERLAY_SCHEME_MAX SUB_PROCESSOR PERFEPP 25

goto :eof

REM 
REM Arguments:
REM 
REM 1: Driver Inf filename in driver store's file repository
REM 2: Driver Inf hardware id
REM 3: Root driver hardware id
REM 
:installRootDevice 
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\%1') do \Windows\OEM\devcon.exe install %%f %3
\Windows\OEM\devcon.exe sethwid @%3 := +%2
for /f "delims=*" %%f in ('dir /b /s \Windows\System32\DriverStore\FileRepository\%1') do \Windows\OEM\devcon.exe update %%f %3
goto :eof

REM 
REM Arguments:
REM 
REM 1: Driver Inf filename
REM 2: Driver Inf hardware id
REM 
:updateDeviceIfNoDriver
\Windows\OEM\devcon.exe status "%2" | findstr /E "Driver is running."
if "%ERRORLEVEL%"=="0" goto :eof
\Windows\OEM\devcon.exe update %1 %2
goto :eof