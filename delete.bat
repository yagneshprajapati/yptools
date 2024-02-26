@echo off
color 0F

set /p confirmReset="This will reset the repository location. Are you sure? (y/n): "

if /i "%confirmReset%"=="y" (
    rmdir /s /q .git
    echo.
    echo Repository location reset successfully.
    echo.

   
) else (
    echo.
    echo Repository location reset cancelled.
    echo.
)

