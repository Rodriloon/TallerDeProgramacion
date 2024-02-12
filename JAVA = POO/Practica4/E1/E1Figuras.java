package tema4;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class E1Figuras {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Triangulo T = new Triangulo(3, 4, 5, "azul", "rojo");
        Circulo C = new Circulo(8, "verde", "amarillo");
        
        System.out.println(T.toString());
        System.out.println(C.toString());
        T.despintar();
        C.despintar();
        System.out.println(T.toString());
        System.out.println(C.toString());
    }
    
}
/*
- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo
debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y
métodos propios. Además debe redefinir el método toString.
B- De igual manera, incluya la clase Círculo a la jerarquía de figuras.
C- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
debe modificar: el de cada subclase o el de Figura?
D- Añada el método despintar que establece los colores de la figura a línea “negra” y
relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?
E- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
representación String de cada uno. Pruebe el funcionamiento del método despintar.
*/