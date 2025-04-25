# Ejemplo: Ejecución paralela de resolución de sistemas de ecuaciones con LAPACK en C

Este ejemplo muestra cómo compilar y ejecutar un programa en C que resuelve sistemas de ecuaciones lineales utilizando la librería `LAPACK`, dentro del clúster HPC.

---

## 📁 Archivos incluidos

- `lapack_test.c`: Código fuente en C que utiliza `dgesv` de LAPACK para resolver sistemas Ax = b.
- `ejecutar_c_lapack.bat`: Script que ejecuta el programa compilado (`lapack_test.exe`) usando diferentes parámetros.
- `parametros.txt`: Archivo que contiene los conjuntos de parámetros para las ejecuciones (tamaño de matriz y semilla).

---

## ⚙️ Descripción del programa

`lapack_test.c` realiza los siguientes pasos:

1. Genera un sistema aleatorio Ax = b de tamaño `n × n`.
2. Utiliza la función `dgesv_` de LAPACK para resolver el sistema.
3. Mide el tiempo de solución.
4. Guarda la solución y el tiempo en un archivo:

```
resultado_<n>_<semilla>.dat
```

donde `<n>` es el tamaño de la matriz y `<semilla>` es la semilla aleatoria usada.

---

## 🚀 Instrucciones para ejecutar en el clúster

### Paso 1: Compilar el programa

Crear un **"New Single-Task Job"**:

- **Command line**:

  ```bat
  gcc lapack_test.c -o lapack_test.exe -llapack -lblas
  ```

- **Working directory**:

  ```
  \\10.0.0.1\HPCShare\usuario\Ejemplo_C_Lapack\
  ```

- Hacer clic en **Submit**.

> ✅ Solo es necesario compilarlo una vez, ya que los nodos acceden al mismo almacenamiento compartido.

---

### Paso 2: Ejecutar el programa en paralelo

Crear un **"New Parametric Sweep Job"**:

- **Command line**:

  ```bat
  ejecutar_c_lapack.bat *
  ```

  (el `*` será reemplazado automáticamente por el número de línea en `parametros.txt`)

- **Working directory**:

  ```
  \\10.0.0.1\HPCShare\usuario\Ejemplo_C_Lapack\
  ```

- **Start value**: `1`
- **End value**: Número de líneas en `parametros.txt`.
- **Increment value**: `1`

Luego haz clic en **Submit**.

---

## ✅ Resultado esperado

Cada ejecución generará un archivo:

```
resultado_<n>_<semilla>.dat
```

Que contendrá:

- La solución del sistema Ax = b.
- El tiempo de ejecución.

---

## ⚙️ Consideraciones adicionales

- Podrías modificar `ejecutar_c_lapack.bat` para que primero verifique si existe `lapack_test.exe`. Si no existe, podría compilarlo automáticamente antes de ejecutar.
- El clúster ya tiene instaladas las librerías necesarias (`LAPACK` y `BLAS`).

---

## 📌 Notas

- Sustituye `usuario` en las rutas UNC por tu nombre de usuario institucional.
- Asegúrate de que la compilación no tenga errores antes de enviar el trabajo paramétrico.
- No es necesario compilar el programa en cada nodo; basta una sola vez debido al almacenamiento compartido.