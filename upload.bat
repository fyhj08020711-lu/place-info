@echo off
chcp 65001 >nul
cd /d "%~dp0"

set REPO=https://github.com/fyhj08020711-lu/place-info.git

where git >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Git is not installed. Download: https://git-scm.com/download/win
  pause
  exit /b 1
)

if not exist ".git" (
  git init
)

git config user.name "fyhj08020711-lu"
git config user.email "fyhj08020711-lu@users.noreply.github.com"
git config core.autocrlf false

git branch -M main
git remote remove origin >nul 2>nul
git remote add origin %REPO%

git add -A
git commit -m "update %date% %time%"

git pull origin main --allow-unrelated-histories --no-rebase --no-edit -X ours

git push -u origin main
if errorlevel 1 (
  echo.
  echo [FAILED] Push failed. Please take a screenshot of this window.
  pause
  exit /b 1
)

echo.
echo [OK] Uploaded. Site: https://fyhj08020711-lu.github.io/place-info/
echo      (GitHub Pages may take 1-2 minutes to update)
pause