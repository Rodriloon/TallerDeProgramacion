package ConcursoBaile;

public class Concurso {
    
    private Pareja vector[];
    private int dimF;
    private int dimL;

    public Concurso(int dimF) {
        this.dimF = dimF;
        this.dimL = 0;
        vector = new Pareja[dimF];
    }
    
    public void agregarPareja(Pareja p){
        int i = 0;
        while (vector[i] != null){
            i++;
        }
        vector[i] = p;
        dimL++;
    }
    
    public Pareja mayorDiferencia(){
        Pareja parejaM = null;
        int mayor = -1;
        for (int i = 0; i < dimL; i++){
            if (vector[i].diferenciaEdad() > mayor){
               mayor = vector[i].diferenciaEdad();
               parejaM = vector[i];
            }
        }
        return parejaM;
    }
    
}
