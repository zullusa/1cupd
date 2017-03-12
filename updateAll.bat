if "%logfolder%" EQU "" @goto cmdMessage
color 4e

if "%needbackup%" EQU "1" @call ./backupAll.bat

set log1cfile=%logfolder%update1cAll-%now%.log

for /F "usebackq delims=;" %%i in ("%basesfile%") do (
	echo %%i>>%log1cfile%
	for /F "usebackq delims=;" %%j in ("%updtfile%") do (
		powershell get-date -format g>>%log1cfile%
		echo %%j>>%log1cfile%
		powershell get-date -format g >> %logfile%
		echo Installing update %%j to %%i... >> %logfile%
		echo Installing update %%j to %%i...
		call "%onecexe%" CONFIG /%basetype% "%server%\%%i" /N %user% /P %pass% /UpdateCfg "%%j" /Out "%log1cfile%" -NoTruncate  >> %logfile%
	)
	powershell get-date -format g >> %logfile%
	echo Commiting configuration %%i...>>%logfile%
	echo Commiting configuration %%i...
	echo Commiting>>%log1cfile%
	powershell get-date -format g>>%log1cfile%
	call "%onecexe%" CONFIG /%basetype% "%server%\%%i" /N %user% /P %pass% /UpdateDBCfg /Out "%log1cfile%" -NoTruncate >> %logfile%
)
powershell get-date -format g >> %logfile%

goto endProcedure
:cmdMessage
echo ----------------------------------------------------
echo █   USE run.bat with params                        █
echo █         "upd"                                    █
echo █         1c admin name                            █
echo █         1c admin password                        █
echo ----------------------------------------------------
pause
:endProcedure