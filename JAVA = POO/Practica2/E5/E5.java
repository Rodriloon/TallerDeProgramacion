package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class E5 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar(); 
        
        int dimF = 20;
        Partido vector [] = new Partido [dimF];
        
        String vis, loc;
        int Gvis;
        int Gloc;
        int i= 0;
        vis = Lector.leerString();
        while ((i < dimF) && (!"ZZZ".equals(vis))){
            loc = Lector.leerString();
            Gvis = Lector.leerInt();
            Gloc = Lector.leerInt();
            vector[i] = new Partido();
            vector[i].setLocal(loc);
            vector[i].setVisitante(vis);
            vector[i].setGolesLocal(Gloc);
            vector[i].setGolesVisitante(Gvis);
            i++;
            System.out.println("Ingrese el nombre del visitante del siguiente partido");
            vis = Lector.leerString();
        }
        
        i = 0;
        int riv = 0;
        int boc = 0;
        while ((i < dimF) && (vector[i] != null)){
            System.out.println("Local: " + vector[i].getLocal() + " " + vector[i].getGolesLocal());
            System.out.println("Visitante: " + vector[i].getVisitante() + " " + vector[i].getGolesVisitante());
            if ("River".equals(vector[i].getGanador()))
                riv++;
            if ("Boca".equals(vector[i].getLocal()))
                boc = boc + vector[i].getGolesLocal();
            i++;
        }
        System.out.println("La cantidad de partidos que gano River es: " + riv);
        System.out.println("La cantidad de goles que hizo Boca de local es: " + boc);
    }
    
}

/*
Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:

    getLocal() retorna el nombre (String) del equipo local
    getVisitante() retorna el nombre (String) del equipo visitante
    getGolesLocal() retorna la cantidad de goles (int) del equipo local
    getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
    setLocal(X) modifica el nombre del equipo local al “String” X
    setVisitante(X) modifica el nombre del equipo visitante al “String” X
    setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
    setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
    hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
    getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
    un String vacío).
    hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
*/