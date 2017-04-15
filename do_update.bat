@echo off
mode con: cp select=1251 > nul
if "%logfolder%" EQU "" goto cmdMessage
color 4e
if "%needbackup%" EQU "1" call ./do_backup.bat

for /F "usebackq delims=;" %%i in ("%basesfile%") do (
	cls
	echo ----------------------------------------------------
	echo ÍÅ ÇÀÊÐÛÂÀÒÜ ÎÊÍÎ ÄÎ ÒÎÃÎ, ÊÀÊ ÍÅ ÁÓÄÅÒ ÏÐÅÄËÎÆÅÍÎ
	echo DO NOT CLOSE THE WINDOW UNTIL SUGGESTION
	echo ----------------------------------------------------
	echo Updating %%i ...
	echo [info] -----------------------------%%i----------------------------- >> %log1cfile%
	for /F "usebackq delims=;" %%j in ("%updtfile%") do (
		echo Installing %%j ...
		powershell get-date -format g >> %logfile%
		echo Installing update %updtsdir%\%%j\1cv8.cfu to %server%\%%i... >> %logfile%
		powershell get-date -format g >> %log1cfile%
		echo [info] %%j >> %log1cfile%
		call "%onecexe%" CONFIG /%basetype% "%server%\%%i" /N %user% /P %pass% /UpdateCfg "%updtsdir%\%%j\1cv8.cfu" /Out "%log1cfile%" -NoTruncate  >> %logfile%
	)
	powershell get-date -format g >> %logfile%
	powershell get-date -format g >> %log1cfile%
	echo [warn] Commiting configuration %%i...  >> %logfile%
	echo [warn] Commiting configuration %%i...  >>%log1cfile%
	call "%onecexe%" CONFIG /%basetype% "%server%\%%i" /N %user% /P %pass% /UpdateDBCfg /Out "%log1cfile%" -NoTruncate >> %logfile%
)
powershell get-date -format g >> %logfile%

goto endProcedure
:cmdMessage
echo ----------------------------------------------------
echo -   USE run.bat with params                        -
echo -         "upd"                                    -
echo -         1c admin name                            -
echo -         1c admin password                        -
echo ----------------------------------------------------
pause
:endProcedure