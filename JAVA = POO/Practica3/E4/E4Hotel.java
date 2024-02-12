package tema3;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class E4Hotel {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int dimF = Lector.leerInt();
        int dimL;
        Hotel Hot = new Hotel(dimF);
        
        for (dimL = 0; dimL < dimF; dimL++){
            Cliente C = new Cliente();
            Habitacion H = new Habitacion();
            C.setNom(Lector.leerString());
            C.setDni(Lector.leerInt());
            C.setEdad(Lector.leerInt());
            Hot.setCliEnX(C, dimL);
        }
        
        for (dimL = 0; dimL < dimF; dimL++)
            System.out.println(Hot.toString(dimL));
        
        Hot.Aumento(Lector.leerDouble());
        
        for (dimL = 0; dimL < dimF; dimL++)
            System.out.println(Hot.toString(dimL));
        
    }
    
}
/*
Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).

(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/
2000 y 8000.
(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}

B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.

NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación.

*/