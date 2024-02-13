package ServicioMeteorologico;

public class PromedioAnual extends Promedio{

    
    public PromedioAnual(int N) {
        super(N);
    }
    
    @Override
    public String promedio() {
        String aux = "";
        for (int i = 0; i < super.getA(); i++){
            double prom = 0;
            for (int j = 0; j < 12; j++){
                prom = prom + super.matriz[j][i];
            }
            aux = aux + " En el año " + super.getA() + " el promedio fue: " + prom + "°C;";
        }
        return aux;
    }

}
