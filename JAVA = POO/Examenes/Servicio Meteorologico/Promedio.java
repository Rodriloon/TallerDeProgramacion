package ServicioMeteorologico;

public abstract class Promedio {
    
    protected double matriz[][];                //Esto se puede??
    private int A;
    private double maxTemp;
    private String mayTemp;

    public Promedio(int N) {
        this.A = N;
        matriz = new double [A][12];
        maxTemp = 0;
    }
    
    public void agregarT(double temp, int a, int m) {
        matriz[a][m] = temp;
        if (temp > maxTemp){
            maxTemp = temp;
            mayTemp = "La mayor temperatura se registro en el año: " + a + " y en el mes: " + m;
        }
    }
    
    public double devolverT(int a, int m) {
        return matriz[a][m];
    }
    
    public String getMayTemp() {
        return this.mayTemp;
    }
    
    public abstract String promedio();

    public int getA() {
        return A;
    }
    
    
    
}
