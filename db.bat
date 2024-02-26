@echo off
setlocal enabledelayedexpansion

REM Check if the file exists
if exist .db (
    REM Read the database name from the file
    set /p dbName=<.db
) else (
    REM Prompt user for a database name if the file doesn't exist
    set /p dbName="Enter the name of the database: "
    
    REM Save the database name for future use
    echo !dbName! > .db
)

REM Build the phpMyAdmin URL with the specific database structure page
set phpMyAdminUrl=http://localhost/phpmyadmin/

REM Open phpMyAdmin with the specified database structure page
start !phpMyAdminUrl!

exit
