@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [2105.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\Lumia-Drivers-Release
REM mkdir ..\..\Lumia-Drivers-Release

mkdir Lumia-Drivers-Full
mkdir Lumia-Drivers-Full\components
mkdir Lumia-Drivers-Full\definitions
xcopy /cheriky ..\components\ANYSOC Lumia-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\components\QC899X Lumia-Drivers-Full\components\QC899X
xcopy /cheriky ..\definitions\Desktop Lumia-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\Lumia-Drivers-Release\Lumia-Drivers-Full.zip Lumia-Drivers-Full\*

REM move Lumia-Drivers-Full\components\ANYSOC ..\components\ANYSOC
REM move Lumia-Drivers-Full\components\QC899X ..\components\QC899X
REM move Lumia-Drivers-Full\definitions\Desktop ..\definitions\Desktop

rmdir /Q /S Lumia-Drivers-Full