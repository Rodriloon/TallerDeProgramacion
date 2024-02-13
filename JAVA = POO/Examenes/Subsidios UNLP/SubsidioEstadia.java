package Examenes;

public class SubsidioEstadia extends Subsidio{
    
    private String destino;
    private double costoPasaje;
    private int cantDias;
    private double montoxdia;

    public SubsidioEstadia(String destino, double costoPasaje, int cantDias, double montoxdia, String nombreI, String nombrePlan, int fecha) {
        super(nombreI, nombrePlan, fecha);
        this.destino = destino;
        this.costoPasaje = costoPasaje;
        this.cantDias = cantDias;
        this.montoxdia = montoxdia;
    }
    
    @Override
    public double devolverTotal(){
        double aux = costoPasaje + (cantDias * montoxdia);
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = super.toString() + " Monto total: " + devolverTotal() + "Lugar de destino: " + destino + " Dias de estadia: " + cantDias;
        return aux;
    }
}
