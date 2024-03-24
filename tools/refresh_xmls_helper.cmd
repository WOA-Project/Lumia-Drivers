@echo off
rmdir /Q /S ..\definitions
xcopy /cheriky .\definitions\* ..\definitions\
.\DefinitionMigrator.%PROCESSOR_ARCHITECTURE%.exe %CD%\..
echo Manual edits still need to be performed, but bulk lazy migration is done.