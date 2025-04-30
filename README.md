# 🎯 Proyecto: Ejemplos de Ejecución en Clúster HPC FIC

Este repositorio contiene ejemplos de programas diseñados para ejecutarse en un clúster basado en **Microsoft HPC Pack**. Los ejemplos incluyen programas en **Python**, **C**, **C++**, **MPI** y **Java**, listos para ser lanzados usando diferentes tipos de trabajos (Single-Task, Parametric Sweep, MPI Jobs).

---

## 📑 Índice

- [🏛️ Arquitectura del Clúster](#️-arquitectura-del-clúster)
- [⚙️ Plataforma de Ejecución](#️-plataforma-de-ejecución)
- [📂 Espacio compartido](#-espacio-compartido)
- [🧩 Ejemplos disponibles](#-ejemplos-disponibles)
- [📢 Recomendaciones generales](#-recomendaciones-generales)
- [🚀 Cómo empezar](#-cómo-empezar)

---

## 🏛️ Arquitectura del Clúster

El clúster está compuesto de **tres servidores** conectados mediante una red interna:

| Servidor         | Rol                                | Cores disponibles |
|------------------|------------------------------------|-------------------|
| **MasterServer1** | Head Node + Compute Node             | 32 cores          |
| **MasterServer2** | Compute Node                        | 32 cores          |
| **MasterServer3** | Compute Node (parcialmente virtualizado)       | 16 cores          |

Todos los servidores están integrados con almacenamiento compartido a través de la carpeta `\\10.0.0.1\HPCShare\`.

---

## 🧮 Notas sobre Virtualización en el Clúster

El servidor **MasterServer3** ejecuta simultáneamente servicios de virtualización utilizando **Hyper-V**, lo que explica que solo estén disponibles 16 de sus 32 núcleos para el clúster HPC.

Actualmente, en este servidor se alojan **cuatro máquinas virtuales**, destinadas a brindar servicios auxiliares a nivel institucional y académico:

- **VM1:** Windows Server 2022 — Servidor Web + Base de Datos
- **VM2:** Windows Server 2022 — Servidor Web + Base de Datos
- **VM3:** Ubuntu Server 22.04 — Servidor Web con múltiples contenedores Docker
- **VM4:** Ubuntu Server 18.04 — Servidor especializado con ROS (Robot Operating System)

Estas máquinas permiten el despliegue de aplicaciones web, backend de proyectos estudiantiles, y simulaciones con robots en entornos ROS.

Este esquema de virtualización permite aprovechar el hardware del nodo sin comprometer la operación principal del clúster, y fomenta la integración de servicios científicos, educativos y de desarrollo tecnológico sobre una misma infraestructura.
---

## ⚙️ Plataforma de Ejecución

Se utiliza **Microsoft HPC Pack** como software de gestión de trabajos y recursos del clúster.

Los usuarios tienen dos opciones para interactuar con el clúster:

- **Desde Windows**:
  1. Instalar **[HPC Pack Client Utilities (HpcClient_x86.msi o HpcClient_x64.msi)](https://www.microsoft.com/en-us/download/details.aspx?id=106334)** (versión compatible: HPC Pack 2019 Update 3).
  2. Conectar al Head Node (`masterserver1.uat.edu.mx`).

- **Desde navegador web**:
  - Acceder a: [https://masterserver1.uat.edu.mx](https://masterserver1.uat.edu.mx)
  - Iniciar sesión utilizando sus credenciales institucionales.

---

## 📂 Espacio compartido

Cada usuario debe montar la unidad de red para acceder a su espacio de trabajo personal.

### 🔹 Ruta UNC

```
\\masterserver1.uat.edu.mx\HPCShare\usuario
```
*(reemplazando `usuario` por su nombre de usuario institucional).*

---

### 🔹 Cómo montar la carpeta manualmente en Windows

**Opción 1: Desde el Explorador de archivos**

1. Abrir **Explorador de archivos**.
2. Clic derecho en **Este equipo** > **Conectar a unidad de red...**.
3. Unidad: `Z:` (o la que prefieras).
4. Carpeta: `\\masterserver1.uat.edu.mx\HPCShare\usuario`
5. Activar:
   - ✅ "Reconectar al iniciar sesión"
   - ✅ "Conectar usando credenciales diferentes" (si no estás en el dominio)
6. Finalizar y colocar usuario y contraseña:
   - Usuario: `uat\usuario`
   - Contraseña: la de tu cuenta institucional.

**Opción 2: Desde línea de comandos (cmd.exe)**

```bat
net use Z: \\masterserver1.uat.edu.mx\HPCShare\usuario /persistent:yes
```

---

## 🧩 Ejemplos disponibles

| Carpeta                                                                 | Descripción                                      |
|-------------------------------------------------------------------------|--------------------------------------------------|
| [**Ejemplo_Entorno_Virtual_Python**](./Ejemplo_Entorno_Virtual_Python/README.md) | Creación de entorno virtual de Python           |
| [**Ejemplo_Python_Simple**](./Ejemplo_Python_Simple/README.md)         | Ejecución de múltiples simulaciones en paralelo |
| [**Ejemplo_Python_MPI**](./Ejemplo_Python_MPI/README.md)            | Ejecución de simulación distribuida con MPI en Python |
| [**Ejemplo_C_Lapack**](./Ejemplo_C_Lapack/README.md)              | Resolución de sistemas lineales con LAPACK en C |
| [**Ejemplo_C_MPI**](./Ejemplo_C_MPI/README.md)                 | "Hola mundo" paralelo usando MPI en C           |
| [**Ejemplo_Java**](./Ejemplo_Java/README.md)                  | Simulación aleatoria utilizando Java            |

Cada ejemplo incluye su propio `README.md` con instrucciones detalladas para su ejecución.

---

## 📢 Recomendaciones generales

- Verifica siempre que tu entorno de trabajo (entorno virtual, ejecutables compilados, etc.) esté listo **antes** de enviar trabajos.
- Consulta en el portal web de HPC Pack el estado de los nodos y trabajos enviados.
- Evita usar todos los recursos disponibles si no es estrictamente necesario para permitir uso compartido del clúster.
- Usa rutas **UNC** completas en el "Working Directory" y no rutas locales (Para el mejor funcionamiento interno, usa la red privada 10.0.0.1 para el almacenamiento compartido, y la red masterserver1.uat.edu.mx solo desde tu computadora personal).
- Mantén tus carpetas organizadas dentro de `HPCShare`.

---

## 🚀 Cómo empezar

1. **Instala** HPC Client o accede vía navegador.
2. **Conéctate** al Head Node.
3. **Monta** tu carpeta compartida.
4. **Explora** los ejemplos.
5. **Envía** tu primer trabajo al clúster.

¡Bienvenido al procesamiento de alto desempeño con HPC FIC!
