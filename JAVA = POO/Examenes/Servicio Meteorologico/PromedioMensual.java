package ServicioMeteorologico;

public class PromedioMensual extends Promedio{

    
    public PromedioMensual(int N) {
        super(N);
    }
    
    @Override
    public String promedio() {
        String aux = "";
        for (int i = 0; i < 12; i++){
            double prom = 0;
            for (int j = 0; j < super.getA(); j++){
                prom = prom + super.matriz[j][i];
            }
            aux = aux + " En el mes " + i + " el promedio fue: " + prom + "°C;";
        }
        return aux;
    }
    
}
