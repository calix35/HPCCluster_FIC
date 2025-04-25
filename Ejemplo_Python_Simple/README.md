# Ejemplo: Ejecución paralela de simulaciones en Python (parametric sweep)

Este ejemplo muestra cómo ejecutar múltiples instancias de un programa en Python en paralelo dentro del clúster utilizando un trabajo de tipo **"Parametric Sweep Job"**. Cada instancia ejecuta una simulación independiente con diferentes parámetros de entrada.

---

## 📁 Archivos incluidos

- `simulacion.py`: Programa en Python que genera números aleatorios y calcula su promedio.
- `ejecutar_python.bat`: Script por lotes que activa el entorno virtual y ejecuta el programa con los parámetros correspondientes.
- `requirements.txt`: Archivo con el requerimiento del entorno virtual (`numpy`).
- `parametros.txt`: Archivo con los conjuntos de parámetros (uno por línea) a usar en las simulaciones.

---

## ⚙️ Descripción del programa

`simulacion.py` recibe **dos parámetros**:
1. Cantidad de números aleatorios a generar (entero).
2. Semilla para el generador de aleatorios (entero).

El programa genera esa cantidad de números, calcula su promedio y guarda el resultado en un archivo llamado:

```
resultado_<semilla>.dat
```

---

## ⚙️ Requisitos previos

Antes de ejecutar este ejemplo, debes haber creado un **entorno virtual de Python** que contenga `numpy`, usando el ejemplo anterior (`Ejemplo_Entorno_Virtual_Python`).

---

## 🚀 Instrucciones para ejecutar en el clúster

### 1. Crear el entorno virtual (una sola vez)

Usa el ejemplo anterior con:

```bat
crear_entorno_virtual.bat \\10.0.0.1\HPCShare\usuario\Ejemplo_Python_Simple\python_env requirements.txt
```

### 2. Crear un nuevo trabajo de tipo **"Parametric Sweep Job"**

- **Command line**:  
  ```bat
  ejecutar_python.bat *
  ```
  (el símbolo `*` será reemplazado por el número de línea en `parametros.txt`)

- **Working directory**:  
  ```
  \\10.0.0.1\HPCShare\usuario\Ejemplo_Python_Simple\
  ```

- **Start value**: `1`  
- **End value**: `3`  
- **Increment value**: `1`

> Asegúrate de que el archivo `parametros.txt` tenga al menos 3 líneas con los parámetros para cada simulación.

### 3. Hacer clic en **Submit**

---

## ✅ Resultado esperado

El clúster ejecutará 3 simulaciones **en paralelo**, y se generarán archivos:

```
resultado_<semilla>.dat
```

Cada archivo incluirá:

- La semilla utilizada
- Los números generados
- El promedio calculado

---

## 📌 Notas

- Sustituye `usuario` en las rutas UNC por tu nombre de usuario institucional.
- Verifica que los nombres de archivo y parámetros coincidan exactamente.