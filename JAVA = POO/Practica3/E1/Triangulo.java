package tema3;

public class Triangulo {
    
    private double lado1;
    private double lado2;
    private double lado3;
    private String colR;
    private String colL;
    
    public Triangulo(){
        
    }
    
    public Triangulo(double unLado1, double unLado2, double unLado3, String unColorR, String unColorL){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        colR = unColorR;
        colL = unColorL;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public void setColR(String colR) {
        this.colR = colR;
    }

    public void setColL(String colL) {
        this.colL = colL;
    }
    
    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getColR() {
        return colR;
    }

    public String getColL() {
        return colL;
    }

    public double calcularPerimetro(){
        double aux;
        aux = lado1 + lado2 + lado3;
        return (aux);
    }
    
    public double calcularArea(){
        double aux, s;
        s = (lado1 + lado2 + lado3)/ 2;
        aux = Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
        return (aux);
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "lados: " + lado1 + " " + lado2 + " " + lado3 + " , color de relleno: " + colR + " y color de linea: " + colL;
        return (aux);
    }
    
}
/*
Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:

    - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
    - Calcular el perímetro y devolverlo (método calcularPerimetro)
    - Calcular el área y devolverla (método calcularArea)

    B- Realizar un programa que instancie un triángulo, le cargue información leída desde
    teclado e informe en consola el perímetro y el área.

NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
los lados y s = (a+b+c)/2. La función raíz cuadrada es Math.sqrt(#)
*/