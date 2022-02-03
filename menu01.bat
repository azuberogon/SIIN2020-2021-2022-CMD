@echo off
:menu
cls
echo.
echo 1 explorador
echo 2 calc
echo 3 notepad
echo 4 code
echo 0 Salir
echo.
choice /c 12340 /m "selecciona una opcion:"
if %errorLevel%==1 explorer
if %errorLevel%==2 calc
if %errorLevel%==3 notepad
if %errorLevel%==4 code
if %errorLevel%==5 goto final
goto menu

:final