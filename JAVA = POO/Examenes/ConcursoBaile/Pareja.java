package ConcursoBaile;

public class Pareja {
    
    private Participante P1;
    private Participante P2;
    private String estilo;

    public Pareja(Participante p1, Participante p2, String estilo) {
        P1 = p1;
        P2 = p2;
        this.estilo = estilo;
    }
    
    public int diferenciaEdad(){
        if (P1.getEdad() > P2.getEdad()){
            return P1.getEdad() - P2.getEdad();
        }
        else{
            return P2.getEdad() - P1.getEdad();
        }
    }
    
    public String mostrarNombres(){
        return ("Los nombres de la pareja son: " + P1.getNombre() + " y " + P2.getNombre());
    }
    
}
