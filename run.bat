@echo off
setlocal
set "GXX=D:\software\devc++\Dev-Cpp\TDM-GCC-64\bin\g++.exe"
set "SRC=%~1"
if "%SRC%"=="" goto usage
if not exist "%SRC%" goto notfound

set "OUT=%~dpn1.exe"
echo [1/2] Compiling %~nx1 ...
"%GXX%" -std=c++17 -O2 -Wall -g "%SRC%" -o "%OUT%"
if errorlevel 1 goto failed

echo [2/2] Running ...
echo.
"%OUT%"
echo.
if not "%~2"=="nopause" pause
exit /b 0

:usage
echo.
echo   Usage: drag a .cpp file onto this run.bat
echo          or:  run.bat w01_syntax\hello.cpp
echo.
pause
exit /b 1

:notfound
echo   File not found: %SRC%
pause
exit /b 1

:failed
echo.
echo   Build failed. See the errors above.
echo.
pause
exit /b 1