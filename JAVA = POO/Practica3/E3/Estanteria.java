package tema3;

public class Estanteria {
    
    private int dimF;
    private int dimL;
    private Libro2 [] vector;
    
    public Estanteria(){
        
    }
    
    public Estanteria(int cant){
        dimF = cant;
        vector = new Libro2[dimF];
        dimL = 0;
    }
    
    public int cantTotal(){
        return (this.dimL);
    }
    
    public String lleno(){
        String aux;
        if (dimL < dimF)
            aux = "El estante todavia no esta lleno";
        else
            aux = "El estante esta lleno";
        return (aux);
    }
    
    public void agregarLibro(Libro2 L){
        if (dimL < dimF){
            vector[this.dimL] = L;
            this.dimL++;
        }
        else{
            System.out.println("Ya esta llena la estanteria");
        }
    }
    
    public Autor devolver(String nombre){
        Autor librito = null;
        int i = 0;
        while (i < dimL && (!vector[i].getTitulo().equals(nombre)))
            i++;
        if (vector[i].getTitulo().equals(nombre))
            librito = vector[i].getPrimerAutor();
        return (librito);
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