@echo off
cls
mailsend1.19.exe -smtp %smtp% ^
    -port %port% ^
    -ssl ^
    -t %mail_to% ^
    -f %mail_from% ^
    -sub "1C Log %now%" ^
    -log %logMail% ^
    -attach %log1cfile% ^
    -user %smtp_user% ^
    -pass %smtp_pass% ^
    -auth>>%logfile%