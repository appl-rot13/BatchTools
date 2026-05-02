@echo off

set FileDir=%~dp0
set FilePath=%FileDir%FileName.exe

schtasks /create /tn "TaskName" /tr "%FilePath%" /sc DAILY /st 00:00:00
pause
