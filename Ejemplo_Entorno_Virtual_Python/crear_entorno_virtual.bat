@echo off
setlocal

REM Validación de argumentos
if "%~1"=="" (
    echo ❌ Debes proporcionar la ruta del entorno virtual y del archivo requirements.
    echo Uso: crear_entorno_virtual.bat RUTA_ENTORNO RUTA_ARCHIVO_REQUIREMENTS
    exit /b 1
)

if "%~2"=="" (
    echo ❌ Debes proporcionar el archivo requirements.txt.
    echo Uso: crear_entorno_virtual.bat RUTA_ENTORNO ARCHIVO_REQUIREMENTS
    exit /b 1
)

REM CONFIGURACIONES
set VENV_NAME=%~1
set REQUIREMENTS_NAME=%~2
set PYTHON_EXE=C:\Python311\python.exe
set HPC_SHARE=\\10.0.0.1\HPCShare\%USERNAME%
set VENV_DIR=%HPC_SHARE%\%VENV_NAME%
set REQUIREMENTS_FILE=%HPC_SHARE%\%REQUIREMENTS_NAME%

REM Crear entorno virtual en HPCShare del usuario
echo [1/4] Creando entorno virtual en: %VENV_DIR%
%PYTHON_EXE% -m venv "%VENV_DIR%"

REM Validar entorno creado
if exist "%VENV_DIR%\Scripts\activate.bat" (
    echo [2/4] Activando entorno...
    call "%VENV_DIR%\Scripts\activate.bat"

    echo [3/4] Actualizando pip...
    "%VENV_DIR%\Scripts\python.exe" -m pip install --upgrade pip

    if exist "%REQUIREMENTS_FILE%" (
        echo [4/4] Instalando paquetes desde: %REQUIREMENTS_FILE%
        "%VENV_DIR%\Scripts\pip.exe" install -r "%REQUIREMENTS_FILE%"
        echo ✅ Entorno "%VENV_NAME%" creado correctamente en %HPC_SHARE%.
    ) else (
        echo ⚠️ No se encontró %REQUIREMENTS_FILE%. Se creó solo el entorno.
    )

    echo.
    echo Para usarlo:
    echo   "%VENV_DIR%\Scripts\python.exe" tu_script.py
) else (
    echo ❌ Error: No se pudo crear el entorno virtual en %VENV_DIR%.
)

endlocal