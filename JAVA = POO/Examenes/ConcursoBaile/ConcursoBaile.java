package ConcursoBaile;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class ConcursoBaile {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Concurso C = new Concurso(Lector.leerInt());
        
        for (int i = 0; i < 2; i++){
            int dni = Lector.leerInt();
            String nom = Lector.leerString();
            int edad = Lector.leerInt();
            Participante par = new Participante(dni, nom, edad);
            int dni2 = Lector.leerInt();
            String nom2 = Lector.leerString();
            int edad2 = Lector.leerInt();
            Participante par2 = new Participante(dni2, nom2, edad2);
            String esti = Lector.leerString();
            Pareja P = new Pareja(par, par2, esti);
            C.agregarPareja(P);
        }
        
        System.out.println(C.mayorDiferencia().mostrarNombres());
        
    }
    
}

/*
1. Representar un concurso de baile. El concurso tiene a lo sumo N parejas. Cada pareja tiene 2
participantes y un estilo de baile. De los participantes se tiene dni, nombre y edad.

a) Genere las clases necesarias. Provea constructores para iniciar: el concurso para un maximo de N
parejas (inicialmente sin parejas cargadas); las parejas y los participantes a partir de toda su informacion.

b) Implemente metodos en las clases adecuadas para permitir:
 - Agregar una pareja al concurso. Asuma que hay lugar.
 - Obtener la diferencia de edad de la pareja.
 - Obtener la pareja con mas diferencia de edad del concurso.

2) Realice un programa que instancie un concurso, cargue 2 parejas a partir del concurso muestre: los
nombres de los participantes de la pareja con mas diferencia de edad.
*/