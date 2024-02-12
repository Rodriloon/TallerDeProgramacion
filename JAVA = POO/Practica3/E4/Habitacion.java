package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    
    private double cos;
    private boolean ocu;
    private Cliente Cli;
    
    public Habitacion(){
        GeneradorAleatorio.iniciar();
        cos = GeneradorAleatorio.generarInt(8001) + 2000 ;
        ocu = false;
        Cli = null;
    }

    public void setOcu(boolean unOcu) {
        this.ocu = unOcu;
    }

    public void setCli(Cliente unCli) {
        this.Cli = unCli;
    }
    
    public void setCos(double unCos){
        this.cos = this.cos + unCos;
    }

    public double getCos() {
        return cos;
    }

    public boolean isOcu() {
        return ocu;
    }

    public Cliente getCli() {
        return Cli;
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