@echo off

REM
REM This file is meant to help resigning binaries in this repository
REM
REM NOTE: This is the external version of the resigning client, which accepts PFX files and a plain text password as input.
REM       It does not work with Certificate Hashes or HSMs or remote proxies and is for sample purposes only.
REM       The user is meant to replace the paths hardcoded below with his own certificates for usage.
REM

cd ResignClient-External
ResignBSP.exe \SecureBoot\Certs\private\OEMA0-KMCI.pfx \SecureBoot\Certs\private\OEMA0-UMCI.pfx "" "%CD%\..\.."
cd ..