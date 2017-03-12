@if "%logfolder%" EQU "" @goto cmdMessage
@color 4e

@if "%needbackup%" EQU "1" @call ./backupAll.bat

@set log1cfile=%logfolder%update1cAll-%now%.log

@for /F "usebackq delims=;" %%i in ("%basesfile%") do (
	@echo ----------------------------------------------------
	@echo … ‡€Š›‚€’œ ŽŠŽ „Ž ’ŽƒŽ, Š€Š … “„…’ …„‹Ž†…Ž
	@echo DO NOT CLOSE THE WINDOW UNTIL SUGGESTION
	@echo ----------------------------------------------------
	@for /F "usebackq delims=;" %%j in ("%updtfile%") do (
		@powershell get-date -format g >> %logfile%
		@echo Installing update %%j to %%i... >> %logfile%
		@echo Installing update %%j to %%i...
		@call "%onecexe%" CONFIG /%basetype% "%server%\%%i" /N %user% /P %pass% /UpdateCfg "%%j" /Out "%log1cfile%" -NoTruncate  >> %logfile%
	)
	@powershell get-date -format g >> %logfile%
	@echo Commiting configuration %%i...  >> %logfile%
	@echo Commiting configuration %%i...  
	@call "%onecexe%" CONFIG /%basetype% "%server%\%%i" /N %user% /P %pass% /UpdateDBCfg /Out "%log1cfile%" -NoTruncate >> %logfile%
)
@powershell get-date -format g >> %logfile%

@goto endProcedure
:cmdMessage
@echo ----------------------------------------------------
@echo Û   USE run.bat with params                        Û
@echo Û         "upd"                                    Û
@echo Û         1c admin name                            Û
@echo Û         1c admin password                        Û
@echo ----------------------------------------------------
@pause
:endProcedure