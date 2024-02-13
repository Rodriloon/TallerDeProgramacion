package Examenes;

public class SubsidioBienes extends Subsidio{
    
    private Bienes subBienes[];
    private int dimF;
    private int dimL;

    public SubsidioBienes(int d, String nombreI, String nombrePlan, int fecha) {
        super(nombreI, nombrePlan, fecha);
        this.dimF = d;
        dimL = 0;
        subBienes = new Bienes[dimF];
    }
    
    public void agregarBienes(Bienes b) {
        if (dimL < dimF){
            subBienes[dimL] = b;
            dimL++;
        }
    }

    @Override
    public double devolverTotal(){
        double costo_final_bien_i = 0;
        for (int i = 0; i < dimL; i++){
            costo_final_bien_i = costo_final_bien_i + (subBienes[i].getCantidad() * subBienes[i].getCosto());
        }
        return costo_final_bien_i;
    }
    
    @Override
    public String toString() {
        String ayuda = super.toString();
        for (int i = 0; i < dimL; i++){
            ayuda = ayuda + " Descripcion de los bienes solicitados: " + subBienes[i].getDescripcion();
        }
        return ayuda;
    }
}
