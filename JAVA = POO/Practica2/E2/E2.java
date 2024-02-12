package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar(); 
        
        int dimF = 15;
        Persona [] vector = new Persona [dimF];
        
        String nom;
        int dni, edad;
        int i = 0;
        edad = Lector.leerInt();
        while ((i < dimF) && (edad != 0)){
            Persona p1 = new Persona();
            p1.setEdad(edad);
            nom = Lector.leerString(); 
            p1.setNombre(nom);
            dni = Lector.leerInt();
            p1.setDNI(dni);
            vector[i] = p1;
            i++;
            System.out.println("Coloque la edad de la proxima persona");
            edad = Lector.leerInt();
        }
        
        int max, may, men, rep;
        max = i;
        rep = 0;
        may = 0;
        men = 99999999;
        Persona minDNI = vector[0];
        for (i = 0; i < max; i++){
           if (vector[i].getEdad() > 65)
               may++;
           if (vector[i].getDNI() < minDNI.getDNI()){
               minDNI = vector[i];
            }
        }
        System.out.println(may);
        System.out.println(minDNI);
    }
    
}

/*
Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI.
*/