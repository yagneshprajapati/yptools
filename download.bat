@echo off
color 0B

REM Check for local changes
for /f %%i in ('git status --porcelain') do set changes=true

if "%changes%"=="true" (
    echo Local changes found.

    REM Stash local changes
    git stash

    REM Pull changes from GitHub and apply stashed changes
    git pull --rebase origin master
    git stash apply

    REM Check for deleted files
    git status --porcelain | findstr "^ D" > nul
    if %errorlevel% equ 0 (
        echo Restoring deleted files from GitHub...
        git status --porcelain | findstr "^ D" | sed "s/^ D //" | xargs git checkout --
    )

    REM Check for conflicts after applying stashed changes
    git diff --name-only --diff-filter=U | findstr . > nul
    if errorlevel 1 (
        echo.
        echo Changes pulled and merged successfully.
    ) else (
        echo Pull resulted in conflicts. Merging both changes automatically.
        REM Use "git checkout --theirs ." to choose GitHub's changes for all conflicted files
        git checkout --theirs .

        REM Add and commit the merged changes
        git add .
        git commit -m "Merge both local and GitHub changes"

        echo Changes merged successfully.
    )
) else (
    REM No local changes, simply pull
    git pull origin master
    if %errorlevel% neq 0 (
        echo Pull failed. Please resolve any conflicts and pull again.
    ) else (
        echo.
        echo Changes pulled successfully.
    )
)


