@echo off

:inicio
cls
SET /P nombre="Escribe tu nombre: "
if "%nombre%"=="salir" goto final

SET /p apellido="Escribe tu apellido: "
echo hola %nombre% %apellido%
pause
goto inicio

:final
