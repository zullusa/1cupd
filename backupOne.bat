echo ----------------------------------------------------
echo НЕ ЗАКРЫВАТЬ ОКНО ДО ТОГО, КАК НЕ БУДЕТ ПРЕДЛОЖЕНО
echo DO NOT CLOSE THE WINDOW UNTIL SUGGESTION
echo ----------------------------------------------------
set basename=%1
if not exist %backupfolder%%basename% md %backupfolder%%basename% >> %logfile%
powershell get-date -format g>>%logfile%
echo Making backup for %basename%... >> %logfile%
echo Making backup for %basename%...
set backupfile=%backupfolder%%basename%\%basename%-%now%.dt
set backfiletocloud=%basename%.dt
:repeatBackup
powershell get-date -format g>>%log1cfile%
echo backup %basename%>>%log1cfile%
call "%onecexe%" CONFIG /%basetype% "%server%\%basename%" /N %user% /P %pass% /DumpIB "!backupfile!" /Out "%log1cfile%" -NoTruncate>>%logfile%
if not exist "%backupfile%" goto repeatBackup>>%logfile%
echo "%backupfile%" "%cloudfolder%%backfiletocloud%";>>%uploadlistfile%
echo Clearing bakup files older %olderdays% days...>>%logfile%
forfiles /p %backupfolder%%basename% /m *.dt -d -%olderdays% -c "del @file">> %logfile%