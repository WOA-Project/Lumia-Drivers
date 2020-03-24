@echo off
for /f "delims=" %%a in ('call \Windows\OEM\Settings\dat.cmd %SystemDrive%\DPP\MMO\product.dat TYPE') do (
    set type=%%a
)
if "%type%"=="" goto :eof

if "%type%"=="RM-1085" reg import \Windows\OEM\Settings\citymanss.reg
if "%type%"=="RM-1104" reg import \Windows\OEM\Settings\talkmanss.reg
if "%type%"=="RM-1105" reg import \Windows\OEM\Settings\talkmanss.reg
if "%type%"=="RM-1106" reg import \Windows\OEM\Settings\talkmanss.reg
if "%type%"=="RM-1116" reg import \Windows\OEM\Settings\citymands.reg
if "%type%"=="RM-1118" reg import \Windows\OEM\Settings\talkmands.reg

if "%type%"=="RX-127" reg import \Windows\OEM\Settings\hapaneroeb1.reg

if "%type%"=="RM-1152" reg import \Windows\OEM\Settings\saanass.reg

if "%type%"=="RM-1144" reg import \Windows\OEM\Settings\guilinds1.reg
if "%type%"=="RM-1147" reg import \Windows\OEM\Settings\guilinds2.reg

for /f "delims=" %%a in ('call \Windows\OEM\Settings\dat.cmd %SystemDrive%\DPP\MMO\product.dat HWID') do (
    set hwid=%%a
)
if "%hwid%"=="" goto :eof

if "%type%"=="RX-130" (
    if %hwid% GEQ 2000 reg import \Windows\OEM\Settings\hapaneroeb2.reg
    if NOT %hwid% GEQ 2000 reg import \Windows\OEM\Settings\hapaneroeb1.reg
)