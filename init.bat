@echo off
color 0E

REM Function to add a collaborator
:AddCollaborator
echo Choose a collaborator:
echo 1. yagneshprajapati
echo 2. Bhargav-Tiwari
echo 3. sawvisha
echo 4. SohamDorge03
set /p collaboratorChoice="Enter the number corresponding to the desired collaborator: "

set "collaborator="
if /i "%collaboratorChoice%"=="1" set "collaborator=yagneshprajapati"
if /i "%collaboratorChoice%"=="2" set "collaborator=Bhargav-Tiwari"
if /i "%collaboratorChoice%"=="3" set "collaborator=sawvisha"
if /i "%collaboratorChoice%"=="4" set "collaborator=SohamDorge03"

if not defined collaborator (
    echo Invalid collaborator choice. Please choose a valid collaborator.
    goto AddCollaborator
)

if not exist ".git" (
    git init
    git remote add origin https://github.com/yagneshprajapati/yptools.git
    echo.
    echo Repository initialized and remote added successfully.
    echo.

    rem Check if collaborator is already added
    git ls-remote --exit-code origin %collaborator%/%branch% > nul 2>&1
    if errorlevel 1 (
        rem Collaborator not found, add collaborator automatically
        git remote add %collaborator% https://github.com/yagneshprajapati/tools.git
        echo Collaborator %collaborator% added successfully.
    ) else (
        echo Collaborator %collaborator% already added.
    )
) else (
    echo Repository already exists. Please choose another location.
)

pause
