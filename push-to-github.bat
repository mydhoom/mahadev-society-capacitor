@echo off
title Push Capacitor App to GitHub
color 0B
echo ===================================================
echo     Push Mahadev Society Capacitor App to GitHub
echo ===================================================
echo.
echo Make sure you have created a NEW EMPTY repository on GitHub first!
echo (e.g., https://github.com/YOUR_USERNAME/mahadev-society-capacitor)
echo.
set /p REPO_URL="Enter your GitHub Repository URL: "

if "%REPO_URL%"=="" (
    echo [ERROR] No URL entered! Exiting...
    pause
    exit /b 1
)

cd /d "%~dp0"

echo.
echo [1/4] Initializing Git...
git init -b main

echo.
echo [2/4] Adding files...
git add .

echo.
echo [3/4] Committing...
git commit -m "Initial commit for Capacitor Android app with GitHub Actions"

echo.
echo [4/4] Setting remote and pushing...
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git push -u origin main --force

echo.
echo ===================================================
echo   PUSH COMPLETE!
echo   Go to your GitHub repo -> Click "Actions" tab.
echo   Your APK is now building automatically!
echo ===================================================
echo.
pause

