@echo off

cls

for /F "tokens=*" %%x in (readme) do (
    echo %%x
    pause
)