@echo off
cls
set colegios=MAX

set /p nombre="introduce tu nombre:"



set /a year= 2000 + 22  
set /a next_year= %year% + 1
set curso= %year%-%next_year%
echo.
echo.
echo hola %nombre% estas en el instituido %colegio%
el curso %curso%
echo.
echo.
echo.
echo.
