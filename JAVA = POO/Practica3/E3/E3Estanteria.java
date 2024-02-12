package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E3Estanteria {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int dimF = 20;
        int i = 0;
        Estanteria E = new Estanteria(dimF);
        
        String tit = Lector.leerString();
        while ((i < dimF) && (!tit.equals("ZZZ"))){
            Libro2 L = new Libro2();
            Autor A = new Autor();
            L.setTitulo(tit);
            L.setEditorial(Lector.leerString());
            L.setAñoEdicion(Lector.leerInt());
            A.setNom(Lector.leerString());
            A.setBio(Lector.leerString());
            A.setOrigen(Lector.leerString());
            L.setPrimerAutor(A);
            L.setISBN(Lector.leerString());
            L.setPrecio(Lector.leerDouble());
            E.agregarLibro(L);
            i++; 
            tit = Lector.leerString();
        }
        System.out.println("El autor del libro 'Mujercitas' es: " + E.devolver("Mujercitas"));
        
    }
    
}
/*
Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados 
(ii) devolver si el estante está lleno
(iii) agregar un libro al estante 
(iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?

*/