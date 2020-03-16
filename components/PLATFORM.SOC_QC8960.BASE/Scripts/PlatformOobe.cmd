@echo off

REM MBB
powershell -command "[System.Environment]::OSVersion.Version.Build" > psout.txt
set /p osbuild=<psout.txt
del psout.txt

if %osbuild% gtr 18908 (
    \Windows\OEM\devcon.exe update \Windows\OEM\Drivers\WA\qcmbb.wa8960.inf ACPI\QCOM2072
) else (
    \Windows\OEM\devcon.exe update \Windows\OEM\Drivers\WP\qcmbb.wp8960.inf ACPI\QCOM2072
)