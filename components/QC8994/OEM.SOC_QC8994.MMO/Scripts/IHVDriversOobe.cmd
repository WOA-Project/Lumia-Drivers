@echo off
\Windows\OEM\devcon.exe update \Windows\OEM\Drivers\NXPPN547.inf ACPI\PN547
call :installRootDevice proxy_driver.inf Root\GripProxy ROOT\GripProxy\0000
call :updateDeviceIfNoDriver \Windows\OEM\Drivers\oempanel.inf ACPI\MSHW1004

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
