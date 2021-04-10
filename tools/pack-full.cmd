@echo off
REM rmdir /Q /S ..\..\Lumia-Drivers-Release
REM mkdir ..\..\Lumia-Drivers-Release

mkdir Lumia-Drivers-Full
mkdir Lumia-Drivers-Full\components
mkdir Lumia-Drivers-Full\definitions
xcopy /cheriky ..\components\ANYSOC Lumia-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\components\QC899X Lumia-Drivers-Full\components\QC8994
xcopy /cheriky ..\definitions\Desktop Lumia-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\Lumia-Drivers-Full.zip Lumia-Drivers-Full\*

REM move Lumia-Drivers-Full\components\ANYSOC ..\components\ANYSOC
REM move Lumia-Drivers-Full\components\QC899X ..\components\QC8994
REM move Lumia-Drivers-Full\definitions\Desktop ..\definitions\Desktop

rmdir /Q /S Lumia-Drivers-Full