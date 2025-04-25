@echo off
setlocal


REM Ejecutar el programa con mpiexec usando el Python del entorno
mpiexec python_mpi_env\Scripts\python.exe mpi_hello.py

endlocal