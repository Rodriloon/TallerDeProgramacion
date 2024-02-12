package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E2Libro2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Autor Autor = new Autor();
        Autor.setNom(Lector.leerString());
        Autor.setBio(Lector.leerString());
        Autor.setOrigen(Lector.leerString());
        
        Libro2 libro1= new  Libro2( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 Autor, "978-0071809252", 21.72);
        Libro2 libro2= new Libro2("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               Autor, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro2 libro3 = new Libro2();
        
        System.out.println("El autor del libro es: " + Autor.getNom());
        System.out.println("su origen es: " + Autor.getOrigen());
        System.out.println("y su biografia: " + Autor.getBio());
        
    }
    
}
/*
Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro.
B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los
libros con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de
los libros instanciados, obtenga e imprima la representación del autor de ese libro.
*/