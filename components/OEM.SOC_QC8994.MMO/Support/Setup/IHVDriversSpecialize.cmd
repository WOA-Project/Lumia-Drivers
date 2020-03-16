@echo off

REM NFC
powershell -command "[System.Environment]::OSVersion.Version.Build" > psout.txt
set /p osbuild=<psout.txt
del psout.txt

set ossupport=1803
if %osbuild% gtr 17134 set ossupport=1809
if %osbuild% gtr 17763 set ossupport=1903

copy \Windows\OEM\Drivers\MSNfcI2C547.%ossupport%.dll \Windows\OEM\Drivers\MSNfcI2C547.dll
copy \Windows\OEM\Drivers\nxppn547.%ossupport%.cat \Windows\OEM\Drivers\nxppn547.cat

\Windows\OEM\devcon.exe update \Windows\OEM\Drivers\oempanel.inf ACPI\MSHW1004