@echo off
chcp 65001>nul
::SPECIFY basetype = {F - filesystem or S - sqlserver}
set basetype=F
::SPECIFY server as servername for SQL version 1C (basetype = S) or full path to folder, where configs layout for Filesystem version 1C (basetype = F)
set server=[bases]
set backupfolder=[backup]
set logfolder=[logs]
set onecexe=[path_to_1cv8.exe]
set java=java.exe
set cloudfolder=/[newfolder]/
set needbackup=1
set needUploadToCloud=0
set olderdays=100

set scriptpath=%~dp0
set updtfile=%scriptpath%updates.list
set basesfile=%scriptpath%bases.list
set zu=%scriptpath%ZullusaUploader.jar
set uploadlistfile=%scriptpath%upload.list

set now=%DATE: =0% %TIME: =0%
for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do set now=%%c%%b%%a_%%d%%e

::SPECIFY All available bases, for first name use one character ">"
echo base1;>%basesfile%
echo base2;>>%basesfile%
