:: INSTALL THE PORTABLE ENVIRONEMENT
@echo off
:: Install Variables
set PORTABLE_ENV=portableEnv
set SEVZIP_VERSION=1512
set CMDER_VERSION=1.2.9

:: Create directory for portableEnv
set PORTABLE_ENV=%~dp0%PORTABLE_ENV%
md %PORTABLE_ENV%
cd %PORTABLE_ENV%



:: 7Zip (for extracting cmder and python)
:: TODO at the end of the script move 7zip to cmder's vendor directory
set SEVZIP


set SEVZIP_INSTALLER_EXE=7z%SEVZIP_VERSION%-x64.exe
set SEVZIP_INSTALL=%PORTABLE_ENV%\7zip
set SEVZIP_EXE=%SEVZIP_INSTALL%\7z.exe

echo downloading 7zip ...
powershell -command "& { (New-Object Net.WebClient).DownloadFile('http://www.7-zip.org/a/7z%SEVZIP_VERSION%-x64.exe', '%SEVZIP_INSTALLER_EXE%') }"
echo 7zip downloaded

echo installing 7zip ...
%SEVZIP_INSTALLER_EXE% /S  /D=%PORTABLE_ENV%\7zip
echo 7zip installed

:: CMDER

echo --
echo downloading cmder ...
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://github.com/bliker/cmder/releases/download/v%CMDER_VERSION%/cmder.zip', 'cmder.zip') }"
echo cmder downloaded

echo extracting cmder ...
%SEVZIP_EXE% x cmder.zip
echo cmder installed



:: Install Portable Python