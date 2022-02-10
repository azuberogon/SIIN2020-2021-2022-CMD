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
if %errorLevel%==1 goto opcion1
if %errorLevel%==2 goto opcion2
if %errorLevel%==3 goto opcion3
if %errorLevel%==4 goto opcion4
if %errorLevel%==5 goto final
goto menu

:opcion1
explorer
goto menu

:opcion2
calc
goto menu

:opcion3
notepad
goto menu

:opcion4
code 
goto menu


:final
cls
echo.
echo gracias por tu visita, hasta pronto...