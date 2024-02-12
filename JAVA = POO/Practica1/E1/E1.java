package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class E1 {
    
    public static void main(String[] args) {    
        GeneradorAleatorio.iniciar(); 
        
        int DF = 11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i = 0; i < DF; i++) 
            tabla2[i] = 2 * i;
        
        int num = GeneradorAleatorio.generarInt(12);
        while (num != 11){
            System.out.println("2*" + num + "="+tabla2[num]);
            num = GeneradorAleatorio.generarInt(12);
        }
        System.out.println("2*" + num + "=" + (2* num));
        
    }
}
/*
     Analice el programa Ej01Tabla2.java, que carga un vector que representa la
    tabla del 2. Luego escriba las instrucciones necesarias para:
   - generar enteros aleatorios hasta obtener el número 11. Para cada número
    muestre el resultado de multiplicarlo por 2 (accediendo al vector).
*/