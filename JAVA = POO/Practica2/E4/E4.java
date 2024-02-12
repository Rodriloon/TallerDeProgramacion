package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E4 {

    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        
        int dimD = 5;
        int dimP = 8;
        Persona [][] matriz = new Persona [dimD][dimP];
        
        int dni, edad;
        String nom = Lector.leerString();
        int i = 0;
        int j;
        while ((i < dimD) && (!"ZZZ".equals(nom))){
            j = 0;
            while ((j < dimP) && (!"ZZZ".equals(nom))){
                dni = Lector.leerInt();
                edad = Lector.leerInt();
                matriz[i][j] = new Persona();
                matriz[i][j].setNombre(nom);
                matriz[i][j].setDNI(dni);
                matriz[i][j].setEdad(edad);
                j++;
                System.out.println("Ingrese el nombre de la siguiente persona: ");
                nom = Lector.leerString();
            }
            i++;
        }
        
        i = 0;
        j = 0;
        while ((i < dimD) && (matriz[i][j] != null)){
            j = 0;
            while ((j < dimP) && (matriz[i][j] != null)){
                System.out.print("En el dia " + (i + 1) + " y el turno " + (j + 1) + " el nombre de la persona es: ");
                System.out.println(matriz[i][j].getNombre());
                j++;
            }
            i++;
        }
        
    }
    
}

/*
Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar.
*/