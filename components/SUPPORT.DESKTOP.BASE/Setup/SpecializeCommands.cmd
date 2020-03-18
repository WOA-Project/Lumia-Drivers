@echo off

date 03-18-2020

for /f %%f in ('dir /b /s \Windows\OEM\Setup\Specialize\*.cmd') do (
    cmd.exe /c %%f
)