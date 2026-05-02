@echo off

set TargetFiles="Thumbs.db"

for /f "tokens=*" %%f in (
  'dir "%~dp0" /a-d /b /s ^| findstr %TargetFiles%'
) do (
  echo Deleting "%%f"...
  del /a /f "%%f"
)

pause
