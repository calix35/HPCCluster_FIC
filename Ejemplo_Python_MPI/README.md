# Ejemplo: Ejecución de un programa en Python con MPI

Este ejemplo muestra cómo ejecutar un programa en Python que utiliza la librería `mpi4py` para distribuir trabajo entre múltiples procesos, utilizando `mpiexec` en el clúster HPC.

---

## 📁 Archivos incluidos

- `mpi_hello.py`: Programa en Python que genera listas de números aleatorios para cada proceso y calcula su suma local.
- `run_mpi_python.bat`: Script que ejecuta el programa con múltiples procesos usando `mpiexec`.
- `requirements.txt`: Contiene la librería `mpi4py` necesaria para ejecutar el programa.

---

## ⚙️ Descripción del programa

`mpi_hello.py` genera, para cada proceso, una lista de números específicos, calcula su suma local y guarda el resultado en un archivo de salida:

```
salida_<rank>.dat
```

Donde `<rank>` es el identificador del proceso dentro del grupo MPI.

Cada proceso:
- Genera su propio conjunto de datos.
- Calcula la suma de esos datos de manera independiente.
- Escribe un archivo de salida con:
  - Su número de proceso (`rank`) y número total de procesos (`size`).
  - Los datos generados.
  - El resultado de su suma local.

---

## ⚙️ Comando ejecutado

El script `run_mpi_python.bat` utiliza el siguiente comando:

```
mpiexec python_mpi_env\Scripts\python.exe mpi_hello.py
```

Esto ejecuta el programa `mpi_hello.py` dentro del entorno virtual `python_mpi_env` utilizando `mpiexec` para lanzarlo en paralelo en varios núcleos del clúster.

---

## ⚙️ Requisitos previos

Antes de ejecutar este ejemplo, debes haber creado un entorno virtual llamado `python_mpi_env` con el siguiente comando (usando el [Ejemplo_Entorno_Virtual_Python](../Ejemplo_Entorno_Virtual_Python/README.md)):

```bat
crear_entorno_virtual.bat Ejemplo_Python_MPI\python_mpi_env Ejemplo_Python_MPI\requirements.txt
```

---

## 🚀 Instrucciones para ejecutar en el clúster

### 1. Crear un nuevo trabajo con **"New Job"**

- Ve a la sección **"Job Details"** y asigna un nombre al Job.

### 2. Agregar una tarea

- Haz clic en **"Edit Tasks"** > **"Add"**.
- En **"Command line"**, escribe:

  ```bat
  run_mpi_python.bat
  ```

- En **"Working directory"**, pon:

  ```
  \\10.0.0.1\HPCShare\usuario\Ejemplo_Python_MPI\
  ```

- En la parte inferior, especifica los recursos:
  - **Minimum**: Número mínimo de núcleos para ejecutar el trabajo.
  - **Maximum**: Número máximo de núcleos a utilizar (máximo 80).

  > Nota: Si seleccionas 80 cores, el job esperará hasta que todos estén disponibles antes de ejecutarse.

### 3. (Opcional) Selección de nodos

- En **"Resource Selection"**, puedes activar:
  - **"Run this job only on nodes in the following list"**
- Selecciona los nodos deseados.
- Asegúrate que la **suma de núcleos de los nodos seleccionados sea ≥ mínimo de la tarea**, o no se ejecutará.

### 4. Enviar el trabajo

- Haz clic en **Submit** para iniciar el trabajo.

---

## ✅ Resultado esperado

Cada proceso MPI generará un archivo:

```
salida_<rank>.dat
```

El archivo contendrá:

- Los datos procesados por ese proceso
- El resultado de la suma local
- Información del identificador (`rank`) y el total de procesos (`size`)

---

## 📌 Notas

- Sustituye `usuario` en las rutas UNC por tu nombre de usuario institucional.
- Este ejemplo utiliza **MPI de Microsoft**, ya disponible en los nodos del clúster.
- El entorno virtual `python_mpi_env` puede renombrarse si se actualiza también en el archivo `.bat`.