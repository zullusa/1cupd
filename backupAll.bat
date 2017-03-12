if "%logfolder%" EQU "" goto cmdMessage
color 4e
SetLocal EnableExtensions EnableDelayedExpansion
set log1cfile=%logfolder%backup1cAll-%now%.log
for /F "usebackq delims=;" %%i in ("%basesfile%") do call backupOne.bat %%i
powershell get-date -format g>>%logfile%
if "%needUploadToCloud%" EQU "1" @goto uploadToCloud

:continueScript
powershell get-date -format g>>%logfile%
echo Clearing log files older %olderdays% days...>>%logfile%
forfiles /p %logfolder% /m *.log -d -%olderdays% -c "del @file">>%logfile%
goto endProcedure

:uploadToCloud
start "upload files to cloud" uploadToCloud.bat %uploadlistfile%
goto continueScript



:cmdMessage
echo ----------------------------------------------------
echo █   USE run.bat with params                        █
echo █         "bak"                                    █
echo █         1c admin name                            █
echo █         1c admin password                        █
echo ----------------------------------------------------
pause
:endProcedure