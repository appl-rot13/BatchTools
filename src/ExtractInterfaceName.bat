@echo off

set IPAddress="192.168.64.3"

for /f tokens^=2^ delims^=^" %%f in ('netsh interface ip show address') do (
  netsh interface ip show address "%%f" | findstr /e %IPAddress% > NUL
  if not ERRORLEVEL 1 (
    echo Interface Name: %%f
    goto end
  )
)

:end
pause
