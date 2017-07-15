@echo off
call %~dp0setEnvironment.bat
call notepad %basesfile%

for /F "usebackq delims=;" %%I in ("%basesfile%") do (
"%onecexe%" ENTERPRISE /%basetype% "%server%\%%I" /AppAutoCheckMode
)