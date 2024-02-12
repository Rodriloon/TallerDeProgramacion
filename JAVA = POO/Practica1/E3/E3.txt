package tema1;
//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
 
public class E3 {
    
    public static void main(String[] args) {    
        //Paso 2. iniciar el generador aleatorio  
        GeneradorAleatorio.iniciar(); 
        
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int[][]matriz = new int [5][5];
        int i, j;
        for (i = 0; i < 5; i++){
            for (j = 0; j < 5 ; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
        }
                
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i= 0; i < 5; i++){
            for (j = 0; j < 5 ; j++)
                System.out.println("La posicion " + i + j + " tiene: " + matriz[i][j]);
        }
        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int tot = 0;
        for (i= 0; i < 1; i++){
            for (j = 0; j < 5 ; j++)
                tot = tot + matriz[i][j];
        }
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int[]vector = new int [5];
        int totC;
        for (i= 0; i < 5; i++){
            totC = 0;
            for (j = 0; j < 5 ; j++)
                totC = totC + matriz[i][j];
            vector[i] = totC;
        }
        for (i = 0; i < 5; i++)
            System.out.println(vector[i]);
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int num = Lector.leerInt();
        int act;
        int k = 0;
        int l = 0;
        boolean enc = false;
        while ((k < 5) && (enc != true)){
            while ((l < 5) && (enc != true)){
                act = matriz[k][l];
                if (num == act){
                    System.out.println("El numero ingresado se encuentra en la posicion: " + k + "," + l);
                    enc = true;
                }
                l++;
            }
            k++;
        }
        if (enc == false)
            System.out.println("No se encontró el numero");
        
    }
}
/*
Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java
*/