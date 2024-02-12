package tema3;

public class Circulo {
    
    private double radio;
    private String colorR;
    private String colorL;
    
    public Circulo(){
        
    }
    
    public Circulo (double unRadio, String unColorR, String unColorL){
        radio = unRadio;
        colorR = unColorR;
        colorL = unColorL;
    }

    public double getRadio() {
        return radio;
    }

    public String getColorR() {
        return colorR;
    }

    public String getColorL() {
        return colorL;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorR(String colorR) {
        this.colorR = colorR;
    }

    public void setColorL(String colorL) {
        this.colorL = colorL;
    }
    
    public double calcularPerimetro(){
        double aux = (Math.PI * (2 * this.radio));
        return aux;
    }
    
    public double calcularArea(){
        double aux = (Math.PI * (this.radio * this.radio));
        return aux;
    }
    
}
/*
Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)

B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.

NOTA: la constante PI es Math.PI
*/