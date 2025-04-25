# Ejemplo: Crear un entorno virtual de Python en el clúster

Este ejemplo muestra cómo crear un entorno virtual de Python utilizando un script ejecutado como tarea en el clúster. El entorno se crea dentro de la carpeta de trabajo del usuario, e instala automáticamente los paquetes listados en un archivo `requirements.txt`.

---

## 📁 Archivos incluidos

- `crear_entorno_virtual.bat`: Script que crea el entorno virtual y ejecuta `pip install` con los paquetes indicados.
- `requirements.txt`: Lista de paquetes que serán instalados dentro del entorno virtual.

---

## ⚙️ Parámetros del script

```
crear_entorno_virtual.bat <ruta_completa_entorno> <archivo_requirements>
```

- `ruta_completa_entorno`: Ruta UNC donde se creará el entorno. La **última carpeta de la ruta será el nombre del entorno virtual**.
- `archivo_requirements`: Nombre del archivo `.txt` que contiene los paquetes a instalar (debe estar en el mismo directorio de trabajo).

---

## 🚀 Instrucciones para ejecutar en el clúster

1. Inicia sesión en HPC Pack.
2. Crea un nuevo trabajo: **"New Single-Task Job"**.
3. En **"Command line"**, escribe el siguiente comando:

   ```
   crear_entorno_virtual.bat \\10.0.0.1\HPCShare\usuario\Ejemplo_Entorno_Virtual_Python\mientorno requirements.txt
   ```

   🔸 Sustituye `usuario` por tu nombre de usuario de la universidad.  
   🔸 La última carpeta (`mientorno`) será el nombre del entorno virtual creado.

4. En **"Working directory"**, pon la ruta UNC del ejemplo:

   ```
   \\10.0.0.1\HPCShare\usuario\Ejemplo_Entorno_Virtual_Python\
   ```

5. Haz clic en **Submit** para enviar el trabajo.

---

## ✅ Resultado esperado

Al finalizar, en tu carpeta de trabajo aparecerá un nuevo directorio llamado `mientorno` (o el nombre que hayas indicado), que contendrá un entorno virtual de Python con los paquetes especificados instalados.

Puedes activarlo manualmente con:

```
mientorno\Scripts\activate.bat
```

---

## 📌 Requisitos

- Haber iniciado sesión en el clúster.
- Tener acceso a tu carpeta dentro de `HPCShare`.
