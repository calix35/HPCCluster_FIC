# Ejemplo: Ejecución paralela de simulaciones en Python (parametric sweep)

Este ejemplo muestra cómo ejecutar múltiples instancias de un programa en Python en paralelo dentro del clúster utilizando un trabajo de tipo **"Parametric Sweep Job"**. Cada instancia ejecuta una simulación independiente con diferentes parámetros de entrada.

---

## 📁 Archivos incluidos

- `simulacion.py`: Programa en Python que genera números aleatorios y calcula su promedio.
- `ejecutar_python.bat`: Script por lotes que ejecuta el programa directamente desde el entorno virtual.
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

## ⚙️ Consideraciones sobre el entorno virtual

El script `ejecutar_python.bat` **no activa el entorno virtual**, sino que utiliza directamente el ejecutable `python.exe` desde el entorno.

Por defecto, se espera que el entorno esté ubicado en una carpeta llamada `python_env`, y el comando utilizado es:

```
python_env\Scripts\python.exe simulacion.py !TAM! !SEED!
```

> Puedes modificar el nombre del entorno (`python_env`) según tus necesidades, siempre y cuando ajustes la ruta en el archivo `.bat`.

---

## 🚀 Instrucciones para ejecutar en el clúster

### 1. Crear el entorno virtual (una sola vez)

Usa el [Ejemplo: Crear un entorno virtual de Python en el clúster](../Ejemplo_Entorno_Virtual_Python/README.md) para crear el entorno virtual con:

```bat
crear_entorno_virtual.bat Ejemplo_Python_Simple\python_env Ejemplo_Python_Simple\requirements.txt
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
- Asegúrate de que el entorno virtual tenga el nombre correcto o ajusta el script `.bat` si cambias ese nombre.