package tema4;

public class Circulo extends Figura{
    
    private double radio;
    
    public Circulo(double radio, String unColorR, String unColorL){
        super(unColorR, unColorL);
        setRadio(radio);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularArea(){
        double aux = (Math.PI * (2 * this.radio));
        return aux;
    }
    
    public double calcularPerimetro(){
        double aux = (Math.PI * (this.radio * this.radio));
        return aux;
    }
    
    public String toString(){
       String aux = super.toString() + 
                    " radio: " + getRadio();
       return aux;
    }
}