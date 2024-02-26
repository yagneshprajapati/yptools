@echo off

rem Set your database connection details
set "server=localhost"
set "database=shopflix"
set "username=root"
set "password="

rem Set the path to the SQL commands file
set "sqlFile=.\rules\cmd.txt"

rem Export all SQL commands from the "shopflix" database and store them in the specified file
mysqldump -h %server% -u %username% -p%password% %database% --skip-triggers --compact --extended-insert=FALSE --result-file=%sqlFile%

echo SQL commands have been fetched and stored in %sqlFile%
