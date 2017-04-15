@echo off
mode con: cp select=1251 > nul
call %~d0setEnvironment.bat
set user=%2
set pass=%3
set all=%4
set nbu=%5

if not exist %logfolder% md %logfolder%
if "%user%" EQU "" goto scriptMessage
if "%all%" NEQ "all" call notepad %basesfile%
if "%nbu%" EQU "0" set needbackup=0

if "%1" == "upd" goto Update
if "%1" == "bak" goto Backup
goto scriptMessage


:Update
echo ----------------------------------------------------
echo намнбкемхе йнмтхцспюжхи
echo ----------------------------------------------------
echo ме гюйпшбюрэ нймн дн рнцн, йюй ме асдер опедкнфемн
echo DO NOT CLOSE THE WINDOW UNTIL SUGGESTION
echo ----------------------------------------------------
title Update All
call %~d0do_update.bat
goto sendEmail

:Backup
echo ----------------------------------------------------
echo пегепбмне йнохпнбюмхе йнмтхцспюжхи
echo ----------------------------------------------------
echo ме гюйпшбюрэ нймн дн рнцн, йюй ме асдер опедкнфемн
echo DO NOT CLOSE THE WINDOW UNTIL SUGGESTION
echo ----------------------------------------------------
title Backup All
call %~d0do_backup.bat
goto sendEmail

:scriptMessage
echo ----------------------------------------------------
echo SPECIFY bak - to backup, upd - to update (1st parameter mandatory)
echo SPECIFY 1c admin name (2nd parameter mandatory)
echo SPECIFY 1c admin password (3d parameter mandatory)
echo USE all flag if need to process all bases (4th parameter not mandatory)
echo USE 1 flag if need to backup bases (5th parameter not mandatory)
echo ----------------------------------------------------
goto endScript

:sendEmail

goto endProcess
%~d0do_mailsend.bat
:endProcess
color 2A
cls
echo ----------------------------------------------------
echo нймн лнфмн гюйпшрэ
echo YOU MAY CLOSE THE WINDOW
echo ----------------------------------------------------
goto endScript

:endScript
pause
