@echo off
setlocal EnableExtensions DisableDelayedExpansion

echo rename-mkv-track
echo.

where mkvpropedit >nul 2>nul
if errorlevel 1 (
    echo mkvpropedit introuvable.
    echo Installe MKVToolNix puis reessaie.
    pause
    exit /b 1
)

set /p TRACK=Piste a modifier (ex: track:v1, track:a1, track:s1^) : 
if "%TRACK%"=="" (
    echo Aucune piste indiquee.
    pause
    exit /b 1
)

set /p NEWNAME=Nouveau nom de piste (laisser vide pour effacer^) : 

set "FOUND=0"

for %%F in (*.mkv) do (
    set "FOUND=1"
    echo.
    echo Traitement : %%F

    if not "%NEWNAME%"=="" (
        mkvpropedit "%%F" --edit "%TRACK%" --set "name=%NEWNAME%"
    ) else (
        mkvpropedit "%%F" --edit "%TRACK%" --delete name
    )
)

if "%FOUND%"=="0" (
    echo Aucun fichier .mkv trouve dans ce dossier.
    pause
    exit /b 1
)

echo.
echo Termine.
pause
