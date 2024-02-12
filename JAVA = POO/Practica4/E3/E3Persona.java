package tema4;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class E3Persona {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        System.out.println("Ingrese a una persona ");
        String nom = Lector.leerString();
        int dni = Lector.leerInt();
        int edad = Lector.leerInt();
        Persona2 P = new Persona2(nom, dni, edad);
        
        System.out.println("Ingrese a un trabajador ");
        nom = Lector.leerString();
        dni = Lector.leerInt();
        edad = Lector.leerInt();
        String trab = Lector.leerString();
        Trabajador T = new Trabajador(nom, dni, edad, trab);
        
        System.out.println(P.toString());
        System.out.println(T.toString());
        
    }
    
}
/*
Implemente las clases para el siguiente problema. Una garita de seguridad quiere
identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio pueden
entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores, estos son
personas que se caracterizan además por la tarea realizada en el predio.

Implemente constructores, getters y setters para las clases. Además tanto las personas
como los trabajadores deben responder al mensaje toString siguiendo el formato:

 Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
 Trabajadores “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy jardinero.”

B- Realice un programa que instancie una persona y un trabajador y muestre la
representación de cada uno en consola.

NOTA: Reutilice la clase Persona (carpeta tema2).
*/