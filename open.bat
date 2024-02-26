@echo off
setlocal enabledelayedexpansion

REM File to store the folder name
set folderFile=.name

REM Read the stored folder name from the file
if exist !folderFile! (
    set /p folderName=<!folderFile!
) else (
    REM Ask the user for the folder name
    set /p folderName="Enter the name of the folder to open on localhost: "
    REM Save the folder name to the file
    echo !folderName! > !folderFile!
)

REM Open localhost and specified folder in default browser
start http://localhost/%folderName%

REM Exit the script
exit
