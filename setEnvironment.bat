::SPECIFY basetype = {F - filesystem or S - sqlserver}
set basetype=F
::SPECIFY server as servername for SQL version 1C (basetype = S) or full path to folder, where configs layout for Filesystem version 1C (basetype = F)
set server=<bases>
set backupfolder=<backup>
set needbackup=1
set logfolder=<logs>
set onecexe=<path_to_1cv8.exe>
set updtfile=%~dp0updates.list
set basesfile=%~dp0bases.list
set java=java.exe
set zu=%~dp0ZullusaUploader.jar
set cloudfolder=/<newfolder>/
set uploadlistfile=%~dpupload.list
set needUploadToCloud=0
set olderdays=100
set now=%DATE: =0% %TIME: =0%
for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do set now=%%c%%b%%a_%%d%%e

::SPECIFY All available bases, for first name use one character ">"
echo base1;>%basesfile%
echo base2;>>%basesfile%
