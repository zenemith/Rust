@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
REM Run shell as admin (example) - put here code as you like
ECHO %batchName% Arguments: %1 %2 %3 %4 %5 %6 %7 %8 %9
echo "Downloading Latest version info"
cd "C:\Program Files (x86)\GnuWin32\bin"
wget --no-check-certificate https://umod.org/games/rust/latest.json -O "C:\rustcity\rust\latest.json"
pause
echo "Validating if an update is required"
cd "C:\rustcity\rust\"
< installed.json (
  set /p InstalledOxideVersion=
)
< latest.json (
  set /p LatestOxideVersion=
)
pause
if /i "!InstalledOxideVersion!" == "!LatestOxideVersion!" (
echo "No update required"
) else (
echo "Starting Update, make sure your server is turned off before continuing!"
pause
"C:\rustcity\steamcmd\steamcmd.exe" +login anonymous +force_install_dir C:\rustcity\rustx +app_update 258550 +validate +quit
cd "C:\Program Files (x86)\GnuWin32\bin"
wget --no-check-certificate https://umod.org/games/rust/download -O "C:\rustcity\OxideTempZip\Oxide.Rust.zip"
wget --no-check-certificate https://umod.org/games/rust/latest.json -O "C:\rustcity\rust\installed.json"
cd "C:\Program Files\7-Zip\" 
7z x -spe "C:\rustcity\OxideTempZip\Oxide.Rust.zip" -o"C:\rustcity\rust\" -aoa
del "C:\rustcity\OxideTempZip\Oxide.Rust.zip"  
)
exit  
