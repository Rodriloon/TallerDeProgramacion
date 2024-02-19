package TallerMecanico;

public class Taller {
    
    private Auto calendario[][];
    private boolean disponibles[][];
    private int D;
    private int H;

    public Taller(int D, int H) {
        this.D = D;
        this.H = H;
        this.calendario = new Auto[this.D][this.H];
        this.disponibles = new boolean[this.D][this.H];
        for (int i = 0; i < D; i++) {
            for (int j = 0; j < H; j++) {
                this.disponibles[i][j] = true; // Inicializar todos los turnos como disponibles
            }
        }
    }
    
    public int devolverHora(int X){
        if (X == 0){
            return 800;
        }
        else{
            if (X == 1){
                return 1000;
            }
            else{
                if (X == 2){
                    return 1200;
                }
                else{
                    if (X == 3){
                        return 1400;
                    }
                    else{
                        if (X == 4){
                            return 1600;
                        }
                        else
                            return 1800;
                    }
                }
            }
        }
    }
    
    public int solicitarTurno(Auto vehiculo, int dia){
        int aux = 0;
        int i = 0;
        while ((disponibles[dia][i] != true) && (i < H)){
            i++;
        }
        if (disponibles[dia][i] == true){
            aux = devolverHora(i);
            disponibles[dia][i] = false;
            calendario[dia][i] = vehiculo;
        }
        return aux;
    }
    
    public String turnoDisponible(){
        String aux = "Semana completa";
        int dia = 0;
        int hora = 0;
        while ((dia < D) && (disponibles[dia][0] != true)){
            hora = 0;
            while ((disponibles[dia][hora] != true) && (hora < H)){
                hora++;
            }
            dia++;
        }
        if (disponibles[dia - 1][hora] == true){
            aux = "El dia " + (dia - 1) + " a la hora " + hora + " hay un turno disponible";
        }
        return aux;
    }
    
    public String buscarPatente(String pato){
        String aux = "Vehiculo inexistente";
        int i = 0;
        int j = 0;
        while ((!calendario[i][0].getPatente().equals(pato)) && (i < D)){
            j = 0;
            while ((!calendario[i][j].getPatente().equals(pato)) && (j < H)){
                j++;
            }
            i++;
        }
        if (calendario[i][0].getPatente().equals(pato)){
            aux = "Tiene turno el dia " + (i - 1) + " a la hora " + j;
        }
        return aux;
    }
    
    public int buscarVehiculos(int dni, int diaPedido){
        int aux = 0;
        for (int j = 0; j < H; j++){
            if ((calendario[diaPedido][j] != null) && (calendario[diaPedido][j].geterDNI() == dni)){
                aux++;
            }
        }
        return aux;
    }
    
}
