package tema4;

public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String toString(){
        String aux = "CR: "  + getColorRelleno() + 
                     " CL: " + getColorLinea() +
                     " Perimetro: " + this.calcularPerimetro() +
                     " Area: " + this.calcularArea();             
             return aux;
       }

    
    public String getColorRelleno(){
        return colorRelleno;       
    }
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
    public String getColorLinea(){
        return colorLinea;       
    }
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
    
    public void despintar(){
        setColorRelleno("blanco");
        setColorLinea("negro");
    }
}