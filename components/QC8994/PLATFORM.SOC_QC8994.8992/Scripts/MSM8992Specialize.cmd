@echo off

REM Show a warning on MSM8992 for broken reboots
if "%NUMBER_OF_PROCESSORS%"=="6" \Windows\OEM\Setup\Specialize\RebootWarning.exe
