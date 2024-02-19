package TallerMecanico;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class SistemaMecanico {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Taller T = new Taller(6, 6);
        
        for (int i = 0; i < 10; i++){
            String nom = Lector.leerString();
            String ape = Lector.leerString();
            int dni = Lector.leerInt();
            Cliente C = new Cliente(nom, ape, dni);
            
            String mar = Lector.leerString();
            String mod = Lector.leerString();
            String pat = Lector.leerString();
            Auto A = new Auto(mar, mod, pat, C);
            int dia = GeneradorAleatorio.generarInt(6 - 1);
            int horaAsignada = T.solicitarTurno(A, dia);
            if (horaAsignada != 0) {
                System.out.println("Turno asignado para el vehículo " + pat + " el día " + dia + " a las " + horaAsignada);
            } else {
                System.out.println("No se pudo asignar turno para el vehículo " + pat + " el día " + dia);
            }
        }
        
        System.out.println(T.turnoDisponible());
        
        String pato = Lector.leerString();
        System.out.println(T.buscarPatente(pato));
        
        int DNI = Lector.leerInt();
        int diaPedido = Lector.leerInt();
        System.out.println("La cantidad de vehiculos con turno del cliente en ese dia es: " + T.buscarVehiculos(DNI, diaPedido));
    }
    
}
/*
 Un taller mecanico necesita un sistema que le permita manejar los horarios semanales de atencion a sus clientes. 
El taller atiende de lunes a sabado en el horario de 8:00 a 18:00 y los turnos siempre son de dos horas. De los vehiculos 
atendidos se desea conocer su marca, modelo, patente y su dueño. De los clientes se desea conocer su nombre, apellido y dni. 
Los vehiculos deberian crearse con todos sus datos, incluido el dueño. Los clientes deberian crearse con todos sus atributos. 
 
 Implemente las clases, atributos y metodos necesarios para poder realizar:
A) Solicitar un turno para un determinado dia. Se recibe el vehiculo y el dia deseado y el sistema otorga el primer turno disponible 
en el dia pedido. Este metodo deberia devolver la hora asignada si se pudo otorgar el turno o el valor 0 si no se pudo otorgar el turno 
(ese dia ya tenia todos los turnos dados).
B) Consultar primer turno disponible. Este metodo deberia devolver un string con el dia y hora del primer turno disponible.  Deberia 
devolver el strin "Semana completa" si ya no quedan turnos disponibles.
C) Devolver el turno asignado a un vehiculo dada la patente del vehiculo. Se debe devolver un string con el turno asignado (dia y hora)
o el string "Vehiculo inexistente" si no hay un turno asignado a la patente solicitada.
D) Saber la cantidad de vehiculos con turno de un mismo dueño dado su DNI y un determinado dia. Este metodo debe devolver la cantidad de 
vehiculos del cliente con el DNI recibido que tienen turno en el dia pedido. Debe devolver 0 si el cliente no tiene vehiculos con turno en el dia solicitado.

Implemente un programa principal que realice lo siguiente:
1) Cree una agenda semanal.
2) Agregue 10 vehiculos en diferentes dias.
3) Consulte el primer turno disponible.
4) Lea una patente y consulte por el turno asignado de ese vehiculo.
5) Lea un dni y un dia y consulte la cantidad de vehiculos con turno que tiene el cliente leido en el dia leido
*/