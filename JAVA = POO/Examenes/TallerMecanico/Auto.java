package TallerMecanico;

public class Auto {
    
    private String marca;
    private String modelo;
    private String patente;
    private Cliente dueño;

    public Auto(String marca, String modelo, String patente, Cliente dueño) {
        this.marca = marca;
        this.modelo = modelo;
        this.patente = patente;
        this.dueño = dueño;
    }

    public String getPatente() {
        return patente;
    }
    
    public int geterDNI(){
        return dueño.getDni();
    }
    
}
