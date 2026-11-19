@echo off
setlocal
cd /d "%~dp0"

git remote get-url origin >nul 2>&1
if errorlevel 1 goto setremote
goto stage

:setremote
echo.
echo   ===== First run: set your GitHub repo =====
echo.
echo   1. Open https://github.com/new
echo   2. Repository name: lanqiao-2027
echo   3. Do NOT tick "Add a README file"  (keep it empty)
echo   4. Click Create, then copy the URL of the new repo
echo.
set "URL="
set /p URL=  Paste URL here: 
if "%URL%"=="" goto setremote
git remote add origin %URL%
echo.
echo   Remote saved. Continuing...
echo.

:stage
git add -A
git diff --cached --quiet
if errorlevel 1 goto docommit
echo.
echo   Nothing new to commit. Pushing existing commits...
goto push

:docommit
set "MSG="
set /p MSG=  Commit message (press Enter for "daily practice"): 
if "%MSG%"=="" set "MSG=daily practice"
git commit -m "%MSG%"
if errorlevel 1 goto end

:push
echo.
echo   Pushing to GitHub...
git push -u origin main
if errorlevel 1 goto pushfail
echo.
echo   Done. Your work is on GitHub.
goto end

:pushfail
echo.
echo   Push failed.
echo   - If a GitHub sign-in window appeared, log in, then run this file again.
echo   - If the repo does not exist yet, follow the steps above to create it.

:end
echo.
if not "%PUSH_NOPAUSE%"=="1" pause
endlocal
