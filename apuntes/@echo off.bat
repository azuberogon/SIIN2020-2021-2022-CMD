@echo off
:menu_P
cls
echo 1  submenu1   
echo 2   submenu2   
echo 3   submenu3  
echo 4   submenu4   
echo 5   submenu5  
echo 6   submenu6   
echo salir
echo.
echo.

choice /c 12340 /m "selecciona una menu:"
if %errorLevel%==1 goto menu_A
if %errorLevel%==2 goto menu_B
if %errorLevel%==3 goto menu_C
if %errorLevel%==4 goto menu_D
if %errorLevel%==5 goto final
goto menu

choice /c 12340 /m "selecciona una menu:"
if %errorLevel%==1 goto menu_A1
if %errorLevel%==2 goto menu_A2
if %errorLevel%==3 goto menu_A3
if %errorLevel%==4 goto menu
if %errorLevel%==5 goto final
:menu_A1

goto menu1

:menu_A2

goto menu2

:menu_A3

goto menu3

:menu

goto menu

choice /c 12340 /m "selecciona una menu:"
if %errorLevel%==1 goto menu_B1
if %errorLevel%==2 goto menu_B2
if %errorLevel%==3 goto menu_B3
if %errorLevel%==4 goto menu
if %errorLevel%==5 goto final


goto menu_B1

:menu_B2

goto menu_B2

:menu_B3

goto menu_B3

:menu

goto menu
