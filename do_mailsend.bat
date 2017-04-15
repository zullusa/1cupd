@echo off
cls
mailsend1.19.exe -smtp [smtp_host] ^
    -port [smtp_port] ^
    -ssl ^
    -t [to] ^
    -f [from] ^
    -sub "Backup Log %now%" ^
    -log %logMail% ^
    -attach %log1cfile% ^
    -user [smtp_user] ^
    -pass [smtp_pass] ^
    -auth>>%logfile%