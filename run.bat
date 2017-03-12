@echo off
chcp 65001>nul
call %~dp0setEnvironment.bat
set user=%2
set pass=%3
set all=%4
set needbackup=%5

if not exist %logfolder% md %logfolder%
if "%user%" EQU "" goto scriptMessage
if "%all%" EQU "" call notepad %basesfile%
if "%1" == "upd" goto Update
if "%1" == "bak" goto Backup
goto scriptMessage

:Update

echo ----------------------------------------------------
echo ОБНОВЛЕНИЕ КОНФИГУРАЦИЙ
title Update All
set logfile=%logfolder%upd-%now%.log
call %~dp0updateAll.bat
goto endProcess

:Backup
echo ----------------------------------------------------
echo РЕЗЕРВНОЕ КОПИРОВАНИЕ КОНФИГУРАЦИЙ
title Backup All
set logfile=%logfolder%bak-%now%.log
call %~dp0backupAll.bat
goto endProcess

:scriptMessage
echo ----------------------------------------------------
echo SPECIFY bak - to backup, upd - to update (1st parameter mandatory)
echo SPECIFY 1c admin name (2nd parameter mandatory)
echo SPECIFY 1c admin password (3d parameter mandatory)
echo USE all flag if need to process all bases (4th parameter not mandatory)
echo USE 0 or 1 flag if need to backup(5th parameter not mandatory)
echo ----------------------------------------------------
goto endScript

:endProcess
color 08
echo ----------------------------------------------------
echo ОКНО МОЖНО ЗАКРЫТЬ
echo YOU MAY CLOSE THE WINDOW
echo ----------------------------------------------------
goto endScript

:endScript
pause