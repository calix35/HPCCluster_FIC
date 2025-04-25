import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class Simulacion {
    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Uso: java Simulacion <cantidad> <semilla>");
            return;
        }

        int cantidad = Integer.parseInt(args[0]);
        int semilla = Integer.parseInt(args[1]);

        Random random = new Random(semilla);
        double[] datos = new double[cantidad];
        double suma = 0;

        for (int i = 0; i < cantidad; i++) {
            datos[i] = random.nextDouble() * 100;
            suma += datos[i];
        }

        double promedio = suma / cantidad;

        String nombreArchivo = "resultado_" + semilla + ".dat";

        try (FileWriter writer = new FileWriter(nombreArchivo)) {
            writer.write("Semilla: " + semilla + "\n");
            writer.write("Promedio: " + promedio + "\n");
            writer.write("Valores: ");
            for (int i = 0; i < datos.length; i++) {
                writer.write(String.format("%.2f ", datos[i]));
            }
            writer.write("\n");
            System.out.println("Resultado guardado en " + nombreArchivo);
        } catch (IOException e) {
            System.out.println("Error al escribir archivo: " + e.getMessage());
        }
    }
}