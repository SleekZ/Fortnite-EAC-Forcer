@echo off
:-------------------------------------
  IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 
@echo off
title EAC Forcer stolen from Hxrrr

:a
cls
color 9
echo.

echo [Info]: RUN AS ADMIN.
set /p menu="[Y/N] Force EAC?: "
if %menu%==Y goto Yes
if %menu%==y goto Yes
if %menu%==N goto No
if %menu%==n goto No
cls

:Yes
echo Forcing Easy Anti Cheat, please wait.
set /p pause="[Info]: Wait 3 Seconds & Press enter."
echo Forced!

date 10-31-2021

:No
echo.
echo Force EAC you fucking retard.
set /p pause=" "
