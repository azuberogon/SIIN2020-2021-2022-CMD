@echo off
:menu
pause
cls
echo 1  menu   
echo 2   menu   
echo 3   menu   
echo 4   menu   
echo 5   menu   
echo 6   menu   
echo salir
echo.
echo.

choice /c 12340 /m "selecciona una menu_:"
if %errorLevel%==1 goto menu_A
if %errorLevel%==2 goto menu_B
if %errorLevel%==3 goto menu_C
if %errorLevel%==4 goto menu_D
if %errorLevel%==5 goto ------
goto menu


:menu_A
choice /c 12340 /m "selecciona una menu_:"
if %errorLevel%==1 goto menu_A1
if %errorLevel%==2 goto menu_A2
if %errorLevel%==3 goto menu_A3
if %errorLevel%==4 goto menu_A4
if %errorLevel%==5 goto menu
goto menu

:menu_A1
::esto es el menu A1
goto menu
:menu_A2
::esto es el menu A1
goto menu
:menu_A3
::esto es el menu A1
goto menu
:menu_A4
::esto es el menu A1
goto menu

:menu_B
choice /c 12340 /m "selecciona una menu_:"
if %errorLevel%==1 goto menu_B1
if %errorLevel%==2 goto menu_B2
if %errorLevel%==3 goto menu_B3
if %errorLevel%==4 goto menu_B4
if %errorLevel%==5 goto menu
goto menu

:menu_B1
::esto es el menu B1
goto menu

:menu_B2
::esto es el menu B2
goto menu
:menu_B3
::esto es el menu B3
goto menu
:menu_B4
::esto es el menu B4
goto menu

:------


