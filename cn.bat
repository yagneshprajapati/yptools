@echo off
color 0E

set /p repoURL="Enter the repository URL: "
set /p collaborator="Enter the collaborator's GitHub username: "

if not exist ".git" (
    git init
    git remote add origin %repoURL%
    echo.
    echo Repository initialized and remote added successfully.
    echo.

    rem Check if collaborator is already added
    git ls-remote --exit-code origin %collaborator%/%branch% > nul 2>&1
    if errorlevel 1 (
        rem Collaborator not found, prompt to add
        set /p addCollaborator="Collaborator not found. Add %collaborator% as a collaborator? (y/n): "
        if /i "%addCollaborator%"=="y" (
            git remote add %collaborator% %repoURL%
            echo Collaborator added successfully.
        )
    ) else (
        echo Collaborator %collaborator% already added.
    )
) else (
    echo Repository already exists. Please choose another location.
)

