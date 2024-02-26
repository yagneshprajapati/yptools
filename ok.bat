@echo off
setlocal enabledelayedexpansion

REM Set the path to your WampServer installation
set wampPath=C:\wamp64

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

REM Start WampServer
start "" "%wampPath%\wampmanager.exe"

REM Wait for WampServer to start (adjust the timeout as needed)
timeout /t 5 /nobreak > nul

REM Open localhost and specified folder
start http://localhost/%folderName%
