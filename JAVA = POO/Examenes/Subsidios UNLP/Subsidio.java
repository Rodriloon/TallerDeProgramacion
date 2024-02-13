package Examenes;

public abstract class Subsidio {
    
    private String nombreI;
    private String nombrePlan;
    private int fecha;

    public Subsidio(String nombreI, String nombrePlan, int fecha) {
        this.nombreI = nombreI;
        this.nombrePlan = nombrePlan;
        this.fecha = fecha;
    }
    
    public abstract double devolverTotal();
    
    @Override
    public String toString() {
        String aux = " Nombre del investigador: " + nombreI + " Plan de trabajo: " + nombrePlan + " Fecha de solicitud: " + fecha;
        return aux;
    }
    
}
