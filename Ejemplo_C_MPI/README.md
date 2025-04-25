# Ejemplo: Programa en C con MPI (Hola Mundo en paralelo)

Este ejemplo muestra cómo compilar y ejecutar un programa simple en C que utiliza **MPI (Message Passing Interface)** para imprimir un mensaje desde cada proceso. Es útil como prueba básica de ejecución paralela en el clúster HPC.

---

## 📁 Archivos incluidos

- `mpi_hello.c`: Código fuente en C que imprime un mensaje identificando el número de proceso (`rank`) y el total de procesos (`size`).

---

## ⚙️ Descripción del programa

Este programa:

1. Inicializa el entorno MPI.
2. Obtiene el número de proceso actual (`rank`) y el total de procesos (`size`).
3. Imprime un mensaje como:

   ```
   Hola desde el proceso 3 de 8
   ```

4. Finaliza la ejecución de MPI.

---

## 🚀 Instrucciones para ejecutar en el clúster

### Paso 1: Compilar el programa

Crear un **"New Single-Task Job"**:

- **Command line**:

  ```bat
  mpicc mpi_hello.c -o mpi_hello.exe
  ```

- **Working directory**:

  ```
  \\10.0.0.1\HPCShare\usuario\Ejemplo_C_MPI\
  ```

- Haz clic en **Submit**.

### Paso 2: Ejecutar el programa compilado

Crear un nuevo **"New Job"**:

1. En la sección **"Job Details"**, asigna un nombre al Job.
2. Ve a **"Edit Tasks"** > **"Add"**.
3. En **"Command line"**, escribe:

   ```bat
   mpiexec mpi_hello.exe
   ```

4. En **"Working directory"**, coloca:

   ```
   \\10.0.0.1\HPCShare\usuario\Ejemplo_C_MPI\
   ```

5. Abajo, selecciona el número de núcleos a usar:
   - Ejemplo: Minimum = 4, Maximum = 4 (para 4 procesos)

6. Haz clic en **OK** y luego en **Submit**.

---

## ✅ Ver los resultados

Como este programa **no genera archivos de salida**, puedes ver la salida directamente desde HPC Pack:

- Haz doble clic en el Job enviado.
- Selecciona la tarea y elige **"View Task"**.
- En la pestaña **"Results"**, verás la salida estándar (impresión en pantalla) de cada proceso.

---

## 📌 Notas

- Sustituye `usuario` por tu cuenta institucional en las rutas UNC.
- Este ejemplo utiliza **Microsoft MPI**, ya instalado en los nodos del clúster.
- La compilación solo se necesita una vez, gracias al almacenamiento compartido.