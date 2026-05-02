@echo off

set FileDir=%~dp0
set FilePath=%FileDir%FileName.exe

set TaskName=ScheduledTask

schtasks /query /tn "%TaskName%" > nul 2>&1
if %ERRORLEVEL% neq 0 (
  schtasks /create /tn "%TaskName%" /tr "%FilePath%" /sc DAILY /st 00:00:00
) else (
  schtasks /delete /f /tn "%TaskName%"
)

pause
