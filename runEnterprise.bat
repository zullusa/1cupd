@echo off
mode con cp select=1251>nul
call %~dp0setEnvironment.bat
call notepad %basesfile%

for /F "usebackq delims=;" %%I in ("%basesfile%") do (
cls
title %%I
echo [info] --------------------------------------------------------
echo [info]                       Запуск %%I
echo [info] --------------------------------------------------------
"%onecexe%" ENTERPRISE /%basetype% "%server%\%%I" /AppAutoCheckMode
)