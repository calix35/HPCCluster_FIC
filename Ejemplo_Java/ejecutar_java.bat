@echo off
setlocal EnableDelayedExpansion

if "%~1"=="" (
    echo Uso: ejecutar_java.bat ^<numero_linea^>
    exit /b 1
)

REM Compilar el programa (si no se ha compilado)
if not exist Simulacion.class (
    javac Simulacion.java
)

set "INDEX=%~1"
set "COUNT=0"

REM Leer linea especifica desde parametros.txt
for /f "usebackq tokens=1,2" %%A in ("parametros.txt") do (
    set /a COUNT+=1
    if !COUNT! equ %INDEX% (
        set "TAM=%%A"
        set "SEED=%%B"
    )
)

REM Validar si encontró la línea
if "!TAM!"=="" (
    echo Error: no se encontró la línea %INDEX% en parametros.txt
    exit /b 1
)

echo Ejecutando con TAM=!TAM! y SEED=!SEED!
java Simulacion !TAM! !SEED!

endlocal 1


