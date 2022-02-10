@echo off

cls
::crear variable
set filtro=%1 :


if %filtro%== ?? set filtro="*"

for /R C:\Users\siinTA %%f in (%filtro%) do (
    echo %%f
)

