#include <stdio.h>
#include <mpi.h>

int main(int argc, char** argv) {
    int rank, size;

    MPI_Init(&argc, &argv);                 // Iniciar MPI
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);   // ID del proceso
    MPI_Comm_size(MPI_COMM_WORLD, &size);   // Número total de procesos

    printf("Hola desde el proceso %d de %d\n", rank, size);

    MPI_Finalize();                         // Finalizar MPI
    return 0;
}