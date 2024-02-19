package TallerMecanico;

public class Cliente {
    
    private String nombre;
    private String apellido;
    private int dni;

    public Cliente(String nombre, String apellido, int dni) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
    }

    public int getDni() {
        return dni;
    }
    
    
    
}
