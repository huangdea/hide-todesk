@echo off
set "flag_file=C:\Windows\Temp\log.txt"

if exist "%flag_file%" (
    exit /b
)

tsdiscon

echo. > "%flag_file%"


