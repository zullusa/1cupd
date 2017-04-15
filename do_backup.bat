@echo off
mode con: cp select=1251 > nul
if "%logfolder%" EQU "" goto cmdMessage
color 4e
SetLocal EnableExtensions EnableDelayedExpansion

del %uploadlistfile%
for /F "usebackq delims=;" %%i in ("%basesfile%") do (
	cls
	echo ----------------------------------------------------
	echo ÍÅ ÇÀÊÐÛÂÀÒÜ ÎÊÍÎ ÄÎ ÒÎÃÎ, ÊÀÊ ÍÅ ÁÓÄÅÒ ÏÐÅÄËÎÆÅÍÎ
	echo DO NOT CLOSE THE WINDOW UNTIL SUGGESTION
	echo ----------------------------------------------------
	if not exist %backupfolder%%%~i md %backupfolder%%%~i>>%logfile%
	powershell get-date -format g >> %logfile%
	echo Making backup for %%~i... >> %logfile%
	echo Making backup for %%~i...
	echo [info] ---------------------------- %%~i ---------------------------->>%log1cfile%
	set backupfile=%backupfolder%%%~i\%%~i-%now%.dt
	set backfiletocloud=%%~i.dt
	call "%onecexe%" CONFIG /%basetype% "%server%\%%~i" /N %user% /P %pass% /DumpIB "!backupfile!" /Out "%log1cfile%" -NoTruncate>>%logfile%
	echo "!backupfile!" "%cloudfolder%!backfiletocloud!";>>%uploadlistfile%
	echo Clearing bakup files older %olderdays% days... >> %logfile%
	forfiles /p %backupfolder%%%~i /m *.dt -d -%olderdays% -c "del file">> %logfile%
)
powershell get-date -format g >> %logfile%
if "%needUploadToCloud%" EQU "1" goto uploadToCloud


:continueScript
powershell get-date -format g >> %logfile%
echo Clearing log files older %olderdays% days... >> %logfile%
forfiles /p %logfolder% /m *.log -d -%olderdays% -c "del file">> %logfile%
goto endProcedure


:uploadToCloud
start "upload files to cloud" %~d0do_upload_to_cloud.bat %uploadlistfile%
goto continueScript



:cmdMessage
echo ----------------------------------------------------
echo -   USE run.bat with params                        -
echo -         "bak"                                    -
echo -         1c admin name                            -
echo -         1c admin password                        -
echo ----------------------------------------------------
pause
:endProcedure