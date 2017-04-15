@echo off

:: SPECIFY server as servername for SQL version 1C or full path to folder, where configs layout for Filesystem version 1c
set server=d:\1c\bases
:: SPECIFY basetype = {F - filesystem or S - sqlserver}
set basetype=F

set logfolder=[specify\log\folder]
set backupfolder=[specify\backups\folder]
set cloudfolder=[specify/cloud/folder]
set updtsdir=[specify\updates\folder]

:: IN UPDATE list use ONLY version exmpl 3_0_49_21
set updtfile=%~d0updates.list
set basesfile=%~d0bases.list
set uploadlistfile=%~d0upload.list

set onecexe=[specify\path\to\1cv8.exe]
set java=java.exe
set zu=%~d0ZullusaUploader.jar

set needbackup=1
set needUploadToCloud=0
set olderdays=100

set now=%DATE: =0% %TIME: =0%
for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do @set now=%%c%%b%%a_%%d%%e

set log1cfile=%logfolder%1cAll-%now%.log
set logfile=%logfolder%all%now%.log
set logMail=%logfolder%sendmail.log


:: SPECIFY All available bases, for first name use one character ">"
echo base1;>%basesfile%
echo base2;>>%basesfile%
