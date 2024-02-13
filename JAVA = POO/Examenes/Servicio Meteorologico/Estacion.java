package ServicioMeteorologico;

public class Estacion {
    
    private String nombre;
    private int latitud;
    private int longitud;
    private Promedio Prom[];

    public Estacion(String nombre, int latitud, int longitud, int a) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        Prom = new Promedio[1];             //Esto es lo mejor?? 
    }
    
    public void crearRegistro(Promedio p) {
        Prom[0] = p;
    }
    
    @Override
    public String toString() {
        String aux = "Nombre de la estacion: " + nombre + ", Latitud: " + latitud + ", Longitud: " + longitud + Prom[0].promedio();
        return aux;
    }
    
}
