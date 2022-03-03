@echo off

cls

for /R C:\Users\alumnoTARDE %%f in (.bat) do (
    echo %%f
)
