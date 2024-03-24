@echo off
:: BatchGotAdmin
:-------------------------------------
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:--------------------------------------
@echo off
copy DX8VB.DLL %windir%\system32\
copy MSVBVM60.DLL %windir%\system32\
copy MSCOMCTL.OCX %windir%\system32\
copy COMDLG32.OCX %windir%\system32\
copy TABCTL32.OCX %windir%\system32\
regsvr32 DX8VB.DLL
regsvr32 MSVBVM60.DLL
regsvr32 MSCOMCTL.OCX
regsvr32 COMDLG32.OCX
regsvr32 TABCTL32.OCX