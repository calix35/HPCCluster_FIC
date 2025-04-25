# 🎯 Proyecto: Ejemplos de Ejecución en Clúster HPC Pack

Este repositorio contiene ejemplos de programas diseñados para ejecutarse en un clúster basado en **Microsoft HPC Pack**. Los ejemplos incluyen programas en **Python**, **C**, **C++**, **MPI** y **Java**, listos para ser lanzados usando diferentes tipos de trabajos (Single-Task, Parametric Sweep, MPI Jobs).

---

## 🏛️ Arquitectura del Clúster

El clúster está compuesto de **tres servidores** conectados mediante una red interna:

| Servidor        | Rol                                | Cores disponibles |
|-----------------|------------------------------------|-------------------|
| **MasterServer1** | Head Node + Compute Node             | 32 cores          |
| **MasterServer2** | Compute Node                        | 32 cores          |
| **MasterServer3** | Compute Node + Servidor de VMs       | 16 cores          |

Todos los servidores están integrados con almacenamiento compartido a través de la carpeta `\\10.0.0.1\HPCShare\`.

---

## ⚙️ Plataforma de Ejecución

Se utiliza **Microsoft HPC Pack** como software de gestión de trabajos y recursos del clúster.

Los usuarios tienen dos opciones para interactuar con el clúster:

- **Desde Windows**:
  1. Instalar **HPC Pack Client Utilities** (versión compatible: HPC Pack 2019 Update 3).
  2. Conectar al Head Node (`masterserver1.uat.edu.mx`).

- **Desde navegador web**:
  - Acceder a: [https://masterserver1.uat.edu.mx](https://masterserver1.uat.edu.mx)
  - Iniciar sesión utilizando sus credenciales institucionales.

---

## 📂 Espacio compartido

Cada usuario debe montar la unidad de red para acceder a su espacio de trabajo:

- **Ruta UNC**:
  
  ```
  \\10.0.0.1\HPCShare\usuario
  ```

- Para montar automáticamente la carpeta al iniciar sesión:

  En Windows:

  ```bat
  net use Z: \\10.0.0.1\HPCShare\usuario /persistent:yes
  ```

  > Sustituye `usuario` por tu nombre de usuario institucional.

- En Linux o MacOS:

  Utilizar `cifs` o herramientas equivalentes para montar el recurso compartido.

---

## 🧩 Ejemplos disponibles

| Carpeta                         | Descripción                                      |
|----------------------------------|--------------------------------------------------|
| **Ejemplo_Entorno_Virtual_Python** | Creación de entorno virtual de Python           |
| **Ejemplo_Python_Simple**         | Ejecución de múltiples simulaciones en paralelo |
| **Ejemplo_Python_MPI**            | Ejecución de simulación distribuida con MPI en Python |
| **Ejemplo_C_Lapack**              | Resolución de sistemas lineales con LAPACK en C |
| **Ejemplo_C_MPI**                 | "Hola mundo" paralelo usando MPI en C           |
| **Ejemplo_Java**                  | Simulación aleatoria utilizando Java            |

Cada ejemplo incluye su propio `README.md` con instrucciones detalladas para su ejecución.

---

## 📢 Recomendaciones generales

- Verifica siempre que tu entorno de trabajo (entorno virtual, ejecutables compilados, etc.) esté listo **antes** de enviar trabajos.
- Consulta en el portal web de HPC Pack el estado de los nodos y trabajos enviados.
- Evita usar todos los recursos disponibles si no es estrictamente necesario para permitir uso compartido del clúster.
- Usa rutas **UNC** completas en el "Working Directory" y no rutas locales.
- Mantén tus carpetas organizadas dentro de `HPCShare`.

---

## 🚀 Cómo empezar

1. **Instala** HPC Client o accede vía navegador.
2. **Conéctate** al Head Node.
3. **Monta** tu carpeta compartida.
4. **Explora** los ejemplos.
5. **Envía** tu primer trabajo al clúster.

¡Bienvenido al procesamiento de alto desempeño con Microsoft HPC Pack!
