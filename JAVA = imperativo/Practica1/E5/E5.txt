package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E5 {
    
    public static void main(String[] args) {    
        GeneradorAleatorio.iniciar(); 
        
        int filaM = 5;
        int colM = 4;
        int cal,cli;
        int [][] matriz = new int [filaM][colM];
        double [] vector = new double [4];
        
        for (cli = 0; cli < filaM; cli++){
            for (cal = 0; cal < colM; cal++)
                matriz [cli][cal] = 0;
        }
        
        for (cal = 0; cal < colM; cal++)
            vector[cal] = 0;
        
        int calificacion;
        for (cli = 0; cli < filaM; cli++){
            System.out.println("Cliente numero: " + cli);
            for (cal = 0; cal < colM; cal++){
                System.out.println("Ingrese la calificacion del aspecto: " + cal);
                calificacion = GeneradorAleatorio.generarInt(11);
                System.out.println(calificacion);
                matriz [cli][cal] = calificacion;
                vector[cal] = vector[cal] + calificacion;
            }
        }
        
        for (cal = 0; cal < colM; cal++)
            System.out.println("La calificacion promedio del aspecto " + cal + " es: " + (vector[cal] / colM));
    }
}
/*
El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
*/