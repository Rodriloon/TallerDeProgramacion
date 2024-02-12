package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E1Triangulo {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int lado1 = Lector.leerInt();
        int lado2 = Lector.leerInt();
        int lado3 = Lector.leerInt();
        String colorR = Lector.leerString();
        String colorL = Lector.leerString();
        
        Triangulo T = new Triangulo(lado1, lado2, lado3, colorR, colorL);
        
        System.out.println("El perimetro del triangulo es: " + T.calcularPerimetro());
        System.out.println("El area del triangulo es: " + T.calcularArea());
        System.out.println(T.toString());
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