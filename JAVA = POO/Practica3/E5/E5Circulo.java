package tema3;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class E5Circulo {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        double rad = Lector.leerDouble();
        String colR = Lector.leerString();
        String colL = Lector.leerString();
        
        Circulo C = new Circulo();
        C.setRadio(rad);
        C.setColorR(colR);
        C.setColorL(colL);
        System.out.println("El perimetro es: " + C.calcularPerimetro());
        System.out.println("El area es: " + C.calcularArea());
        
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