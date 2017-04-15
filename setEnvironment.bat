@rem SPECIFY server as servername for SQL version 1C or full path to folder, where configs layout for Filesystem version 1c
@set server=d:\1c\bases
@rem SPECIFY basetype = {F - filesystem or S - sqlserver}
@set basetype=F
@set backupfolder=d:\1c\backup
@set needbackup=1
@set logfolder=d:\1c\logs\
@set onecexe=c:\Program Files (x86)\1cv8\8.3.6.2237\bin\1cv8.exe
@set updtfile=%~d0updates.list
@set basesfile=%~d0bases.list
@set java=java.exe
@set zu=%~d0ZullusaUploader.jar
@set cloudfolder=/newfolder/
@set uploadlistfile=%~d0upload.list
@set needUploadToCloud=1
@set olderdays=100
@set now=%DATE: =0% %TIME: =0%
@for /f "tokens=1-7 delims=/-:., " %%a in ( "%now%" ) do @set now=%%c%%b%%a_%%d%%e
set log1cfile=%logfolder%1cAll-%now%.log
set logfile=%logfolder%all%now%.log
set logMail=%logfolder%sendmail.log



@rem SPECIFY All available bases, for first name use one character ">"
@echo base1;>%basesfile%
@echo base2;>>%basesfile%
