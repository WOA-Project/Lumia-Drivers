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

REM Additional power plan settings
powercfg /setdcvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 60
powercfg /setacvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 60

powercfg /setdcvalueindex SCHEME_CURRENT SUB_SLEEP HYBRIDSLEEP Off
powercfg /setacvalueindex SCHEME_CURRENT SUB_SLEEP HYBRIDSLEEP Off

powercfg /setdcvalueindex SCHEME_CURRENT SUB_SLEEP HIBERNATEIDLE 0
powercfg /setacvalueindex SCHEME_CURRENT SUB_SLEEP HIBERNATEIDLE 0

powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 1
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 1

powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS PBUTTONACTION 1
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS PBUTTONACTION 1

powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS SBUTTONACTION 1
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS SBUTTONACTION 1

powercfg /setdcvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE 60
powercfg /setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE 60

powercfg /setdcvalueindex SCHEME_CURRENT SUB_VIDEO ADAPTBRIGHT On
powercfg /setacvalueindex SCHEME_CURRENT SUB_VIDEO ADAPTBRIGHT On

REM Disable WinRE
reagentc.exe /disable