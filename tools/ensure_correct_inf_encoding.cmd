@echo off
echo Ensuring all INF files have the right encoding according to Microsoft guidelines
Powershell -executionPolicy Bypass -File %CD%\ensure_correct_inf_encoding.ps1