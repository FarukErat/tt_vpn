@echo off

C:\Users\%USERNAME%\Documents\AutoHotkey\send_sms.exe
echo "Enter SMS code: "
set /p sms_code=
C:\Users\%USERNAME%\Documents\AutoHotkey\enter_code.exe %sms_code%
