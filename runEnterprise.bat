@echo off
call %~dp0setEnvironment.bat
call notepad %basesfile%

for /F "usebackq delims=;" %%i in ("%basesfile%") do (
"%onecexe%" ENTERPRISE /%basetype% "%server%\%%I" /AppAutoCheckMode
)