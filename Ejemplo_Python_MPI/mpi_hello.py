from mpi4py import MPI
import os

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

# Simulación: suma de una lista
datos = list(range(rank * 10, (rank + 1) * 10))
resultado = sum(datos)

# Ruta de salida en carpeta compartida
ruta_salida = f"salida_{rank}.dat"
with open(ruta_salida, "w") as f:
    f.write(f"Proceso {rank} de {size}\n")
    f.write(f"Datos: {datos}\n")
    f.write(f"Resultado: {resultado}\n")

print(f"[Proceso {rank}] Resultado guardado en {ruta_salida}")
