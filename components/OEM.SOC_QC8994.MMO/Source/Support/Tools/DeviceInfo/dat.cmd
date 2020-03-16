@setlocal enableextensions enabledelayedexpansion
@echo off
set file=%~1
set key=%~2
for /f "usebackq delims=" %%a in ("!file!") do (
    set ln=%%a
        for /f "tokens=1,2 delims=:" %%b in ("!ln!") do (
            set currkey=%%b
            set currval=%%c
            if "x!key!"=="x!currkey!" (
                echo !currval!
            )
        )
)
endlocal