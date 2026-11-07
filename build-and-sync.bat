@echo off
title Mahadev Society - Capacitor Build
color 0A
echo.
echo ============================================
echo   Mahadev Society - Capacitor Android Build
echo ============================================
echo.

echo [1/3] Building web app (sacco-frontend)...
cd /d "%~dp0..\sacco-frontend"
call npm run build
if errorlevel 1 (
    echo ERROR: Web build failed!
    pause
    exit /b 1
)
echo     Web build complete!
echo.

echo [2/3] Syncing web assets into Android project...
cd /d "%~dp0"
call npx cap sync android
if errorlevel 1 (
    echo ERROR: Sync failed!
    pause
    exit /b 1
)
echo     Sync complete!
echo.

echo [3/3] Opening Android Studio...
call npx cap open android
echo.

echo ============================================
echo   DONE! In Android Studio:
echo   Build > Generate Signed Bundle / APK > APK
echo ============================================
echo.
pause

