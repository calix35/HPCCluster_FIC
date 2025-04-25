import sys
import numpy as np

# Leer argumentos
if len(sys.argv) != 3:
    print("Uso: python simulacion_numpy.py <numero> <semilla>")
    sys.exit(1)

numero = int(sys.argv[1])
semilla = int(sys.argv[2])

# Simular datos con NumPy
np.random.seed(semilla)
datos = np.random.uniform(0, 100, size=numero)
promedio = np.mean(datos)

# Guardar resultado en archivo
archivo_salida = f"resultado_{semilla}.dat"
with open(archivo_salida, "w") as f:
    f.write(f"Semilla: {semilla}\n")
    f.write(f"Datos: {datos}\n")
    f.write(f"Promedio: {promedio:.2f}\n")

print(f"[Semilla {semilla}] Resultado guardado en {archivo_salida}")