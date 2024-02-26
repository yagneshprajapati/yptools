@echo off
color 0C

echo Stopping WampServer services...

REM Specify the path to httpd.exe (Apache)
set "apachePath=C:\wamp64\bin\apache\apache2.4.52\bin\httpd.exe"

REM Specify the path to mysqld.exe (MySQL)
set "mysqlPath=C:\wamp64\bin\mysql\mysql8.0.27\bin\mysqld.exe"

REM Stop Apache (HTTP) service
"%apachePath%" -k stop

REM Stop MySQL service
mysql --stop

echo WampServer services stopped successfully.

pause
