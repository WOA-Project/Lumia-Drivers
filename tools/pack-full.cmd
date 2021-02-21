@echo off
rmdir /Q /S ..\..\Lumia-Drivers-Release
mkdir ..\..\Lumia-Drivers-Release

mkdir Lumia-Drivers-Full
mkdir Lumia-Drivers-Full\components
mkdir Lumia-Drivers-Full\definitions
move ..\components\ANYSOC Lumia-Drivers-Full\components\ANYSOC
move ..\components\QC8994 Lumia-Drivers-Full\components\QC8994
xcopy /cheriky ..\definitions\Desktop Lumia-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\Lumia-Drivers-Full.zip Lumia-Drivers-Full\*

move Lumia-Drivers-Full\components\ANYSOC ..\components\ANYSOC
move Lumia-Drivers-Full\components\QC8994 ..\components\QC8994
REM move Lumia-Drivers-Full\definitions\Desktop ..\definitions\Desktop

rmdir /Q /S Lumia-Drivers-Full