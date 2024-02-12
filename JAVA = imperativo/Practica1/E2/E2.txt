package tema1;
//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class E2 {
    
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double altura;
        
        //Paso 3: Crear el vector para 15 double 
        int DF = 3;
        double[]vector = new double[DF]; 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double tot = 0;
        int cant = 0;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < DF; i++){
            altura = Lector.leerDouble(); 
            vector[i] = altura;
            tot = tot + altura;
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        tot = tot / 3;
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i = 0; i < DF; i++){
            if (vector[i] > tot){
                cant++;
            }
        }
     
        //Paso 9: Informar la cantidad.
        System.out.println(tot);
        System.out.println(cant);
    }
}
/*
     Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
    básquet y las almacene en un vector. Luego informe:
   - la altura promedio
   - la cantidad de jugadores con altura por encima del promedio
     NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java
*/