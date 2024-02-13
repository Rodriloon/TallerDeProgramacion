package Examenes;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class subsidiosUNLP {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        System.out.println("Ingrese los datos de un subsidio de estadia: ");
        String destino = Lector.leerString();
        double costoPasaje = Lector.leerDouble();
        int cantDias = Lector.leerInt();
        double montoxdia = Lector.leerDouble();
        String nombreI = Lector.leerString();
        String nombrePlan = Lector.leerString();
        int fecha = Lector.leerInt();
        SubsidioEstadia SE = new SubsidioEstadia(destino, costoPasaje, cantDias, montoxdia, nombreI, nombrePlan, fecha);
        
        System.out.println("Ingrese los datos de un subsidio de bienes: ");
        int N = Lector.leerInt();
        String nombreI2 = Lector.leerString();
        String nombrePlan2 = Lector.leerString();
        int fecha2 = Lector.leerInt();
        SubsidioBienes SB = new SubsidioBienes(N, nombreI2, nombrePlan2, fecha2);
        
        for (int i = 0; i < 2; i++){
            System.out.println("Ingrese los datos de bienes: ");
            String descripcion = Lector.leerString();
            int cantidad = Lector.leerInt();
            double costo = Lector.leerDouble();
            Bienes b = new Bienes(descripcion, cantidad, costo);
            SB.agregarBienes(b);
        }
        
        System.out.println(SE.toString());
        System.out.println(SB.toString());
    }
    
}
