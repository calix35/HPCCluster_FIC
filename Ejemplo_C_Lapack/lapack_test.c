#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern void dgesv_(int *n, int *nrhs, double *a, int *lda,
                   int *ipiv, double *b, int *ldb, int *info);

void generarSistema(double *A, double *b, int n, int seed) {
    srand(seed);
    for (int i = 0; i < n * n; i++) {
        A[i] = (double)(rand() % 10 + 1);
    }
    for (int i = 0; i < n; i++) {
        b[i] = (double)(rand() % 10 + 1);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Uso: %s <tamaño_matriz> <semilla>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);
    int seed = atoi(argv[2]);

    double *A = (double *)malloc(n * n * sizeof(double));
    double *b = (double *)malloc(n * sizeof(double));
    int *ipiv = (int *)malloc(n * sizeof(int));

    if (!A || !b || !ipiv) {
        printf("Error: No se pudo reservar memoria\n");
        return 1;
    }

    generarSistema(A, b, n, seed);

    int nrhs = 1, lda = n, ldb = n, info;

    // Iniciar cronómetro
    clock_t start = clock();

    dgesv_(&n, &nrhs, A, &lda, ipiv, b, &ldb, &info);

    // Finalizar cronómetro
    clock_t end = clock();
    double tiempo = (double)(end - start) / CLOCKS_PER_SEC;

    // Nombre del archivo de salida
    char nombreArchivo[100];
    snprintf(nombreArchivo, sizeof(nombreArchivo), "resultado_%d_%d.dat", n, seed);

    FILE *f = fopen(nombreArchivo, "w");
    if (!f) {
        printf("Error al crear archivo %s\n", nombreArchivo);
        return 1;
    }

    if (info == 0) {
        fprintf(f, "Solución del sistema Ax = b (n=%d, seed=%d):\n", n, seed);
        for (int i = 0; i < n; i++) {
            fprintf(f, "x[%d] = %.6f\n", i + 1, b[i]);
        }
        fprintf(f, "\nTiempo de solución: %.6f segundos\n", tiempo);
    } else {
        fprintf(f, "Error en dgesv. Código: %d\n", info);
    }

    fclose(f);
    printf("Resultado guardado en %s\n", nombreArchivo);

    free(A);
    free(b);
    free(ipiv);
    return 0;
}