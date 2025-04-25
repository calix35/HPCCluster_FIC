# Ejemplo: Ejecución paralela de simulaciones en Java

Este ejemplo muestra cómo compilar y ejecutar múltiples instancias de un programa en Java dentro del clúster HPC utilizando **trabajos paramétricos**.

---

## 📁 Archivos incluidos

- `Simulacion.java`: Código fuente en Java que genera números aleatorios y calcula su promedio.
- `ejecutar_java.bat`: Script que compila automáticamente `Simulacion.java` si es necesario, y ejecuta el programa con parámetros especificados.
- `parametros.txt`: Archivo con los conjuntos de parámetros para las ejecuciones (cantidad de números y semilla).

---

## ⚙️ Descripción del programa

`Simulacion.java`:

- Recibe dos parámetros:
  - **Cantidad**: Número de valores aleatorios a generar.
  - **Semilla**: Semilla para el generador de números aleatorios.
- Genera los valores aleatorios y calcula su promedio.
- Guarda la salida en un archivo:

```
resultado_<semilla>.dat
```

que contiene:
- La semilla utilizada
- El promedio calculado
- Todos los valores generados

---

## ⚙️ Funcionamiento del script ejecutar_java.bat

- Verifica si ya existe el archivo `Simulacion.class`.
  - Si no existe, **compila** automáticamente `Simulacion.java` usando `javac`.
- Lee los parámetros correspondientes a la línea indicada desde `parametros.txt`.
- Ejecuta:

```
java Simulacion <cantidad> <semilla>
```

con los valores leídos.

---

## 🚀 Instrucciones para ejecutar en el clúster

### 1. Crear un nuevo trabajo de tipo **"Parametric Sweep Job"**

- **Command line**:

  ```bat
  ejecutar_java.bat *
  ```

  (el símbolo `*` se reemplaza por el número de línea en `parametros.txt`)

- **Working directory**:

  ```
  \\10.0.0.1\HPCShare\usuario\Ejemplo_Java\
  ```

- **Start value**: `1`
- **End value**: Número de líneas en `parametros.txt`.
- **Increment value**: `1`

### 2. Hacer clic en **Submit**

El clúster ejecutará automáticamente las simulaciones en paralelo.

---

## ✅ Resultado esperado

Se generarán archivos de salida:

```
resultado_<semilla>.dat
```

Cada archivo contiene:

- La semilla
- El promedio de los datos
- Los valores aleatorios generados

---

## 📌 Notas

- Sustituye `usuario` en las rutas UNC por tu nombre de usuario institucional.
- No es necesario compilar manualmente el programa, el script `ejecutar_java.bat` lo hace automáticamente si es necesario.
- Asegúrate de que Java esté disponible en los nodos (ya está instalado en el clúster).
