@echo off

for /r %%f in (*.sln) do (
  echo dotnet format "%%f"
  dotnet format "%%f"

  echo;
)

pause
