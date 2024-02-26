@echo off
setlocal enabledelayedexpansion

rem Set your database connection details
set "server=localhost"
set "database=shopflix"
set "username=root"
set "password="

rem Set the path to the SQL commands file
set "sqlFile=./RULES/cmd.txt"

rem Construct the connection string
set "connectionString=-h !server! -u !username! -p!password! !database!"

rem Get a list of existing tables in the database
for /f "tokens=*" %%t in ('mysql %connectionString% -N -e "SHOW TABLES"') do (
    rem Drop each table
    mysql %connectionString% -e "DROP TABLE %%t"
)

rem Execute SQL commands from the file
mysql %connectionString% < %sqlFile%

echo DB ADDED...
