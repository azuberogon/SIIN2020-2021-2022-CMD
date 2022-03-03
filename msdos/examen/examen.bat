:: dia 17/02/2022
:: aitor zubero
@echo off

:menu
choice /c 12345S /m "selecciona una menu_:"
if %errorLevel%==1 goto mostrar_archivos
if %errorLevel%==2 goto Listar_tareas
if %errorLevel%==3 goto ruta
if %errorLevel%==4 goto secuencia
if %errorLevel%==5 goto cadenas
if %errorLevel%==S goto salir
goto menu
 
:mostrar_archivos
SET /p "%ruta%" = "Escribe tu ruta:"
dir %ruta%.bat 
goto menu

:Listar_tareas
TASKLIST

goto menu
:ruta
SET /p "%ruta%" = "Escribe tu ruta:"
tree %ruta%
::esto deeria de darte un esquema no lo hara 

goto menu
:secuencia
::esto es el menu B4
goto menu
for /L %%i in (10,5,50) do (
    echo %%i
)
:cadenas

:salir
goto salir


:salir
cls
:: adios n

