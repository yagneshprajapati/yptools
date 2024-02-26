@echo off
setlocal enabledelayedexpansion

REM Get contributors using git shortlog
for /f "tokens=1,2" %%a in ('git shortlog -sn --all') do (
    set "name=%%b"
    set "totalLinesAdded=0"
    set "totalLinesRemoved=0"

    REM Get commit hashes for the contributor using git rev-list
    for /f "tokens=1" %%c in ('git rev-list --all --author^="%%b"') do (
        set "commitHash=%%c"

        REM Get commit stats using git diff
        for /f "tokens=1,2 delims=," %%d in ('git diff --shortstat !commitHash!^..HEAD') do (
            set "token1=%%d"
            set "token2=%%e"

            REM Extract added and removed counts
            if "!token1!" neq "" (
                set /a "totalLinesAdded+=token1"
            )
            if "!token2!" neq "" (
                set /a "totalLinesRemoved+=token2"
            )
        )
    )

    REM Calculate overall contribution ratio
    set /a "totalLinesChanged=totalLinesAdded + totalLinesRemoved"
    set /a "contributionLevel=totalLinesChanged ? (100 * totalLinesAdded) / totalLinesChanged : 0"

    REM Output contributor details
    echo Contributor: !name!
    echo Contribution Level: !contributionLevel!
    echo.
)
