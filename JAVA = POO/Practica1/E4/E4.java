package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E4 {
    
    public static void main(String[] args) {    
        GeneradorAleatorio.iniciar(); 
        
        int filaM = 4;
        int colM = 8;
        int piso, ofic;
        int [][] matriz = new int [colM][filaM];
        
        for (piso = 0; piso < colM; piso++){
            for(ofic = 1; ofic < filaM; ofic++)
                matriz[piso][ofic] = 0;
        }
        
        piso = Lector.leerInt();
        while (piso != 9){
            ofic = Lector.leerInt();
            matriz[piso - 1][ofic - 1]++;
            piso = Lector.leerInt();
        }
        
        for (piso = 0; piso < colM; piso++){
            for(ofic = 1; ofic < filaM; ofic++)
                System.out.println("En el piso " + (piso + 1) + " y la oficina " + (ofic + 1) + " fueron " + matriz[piso][ofic]);
        }
    }
}
/*
Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
*/