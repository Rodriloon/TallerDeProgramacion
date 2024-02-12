package tema5;

public class Estacionamiento {
    
    private String nombre;
    private String dir;
    private int aper;
    private int cier;
    private int piso, plaza;
    private auto [][] matriz;
    
    public Estacionamiento(String unNombre, String unDir){
        nombre = unNombre;
        dir = unDir;
        aper = 800;
        cier = 2100;
        piso = 5;
        plaza = 10;
        matriz = new auto [piso][plaza];
    }
    
    public Estacionamiento(String unNombre, String unDir, int unAper, int unCier, int i, int j){
        nombre = unNombre;
        dir = unDir;
        aper = unAper;
        cier = unCier;
        piso = i;
        plaza = j;
        matriz = new auto [piso][plaza];
    }

    public String getNombre() {
        return nombre;
    }

    public String getDir() {
        return dir;
    }

    public int getAper() {
        return aper;
    }

    public int getCier() {
        return cier;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public void setAper(int aper) {
        this.aper = aper;
    }

    public void setCier(int cier) {
        this.cier = cier;
    }
    
    public void autoA(auto A, int X, int Y){
        matriz[X][Y] = A;
        matriz[X][Y].setOcu(true);
    }
    
    public String patente(String paten){
        String aux = "Auto Inexistente";
        int X = 0;
        int Y = 0;
        while ((X < piso) && (matriz[X][Y].getPat() != paten)){
            while ((Y < plaza) && (matriz[X][Y].getPat() != paten)){
                Y++;
            }
            X++;
        }
        if (matriz[X][Y].getPat() == paten)
            aux = "piso: " + X + ", plaza: " + Y;
        return aux;
    }
    
    public String toStrings(){
        String aux = "Representacion del estacionamiento: ";
        for (int i = 0; i < piso; i++){
            for (int j = 0; j < plaza; j++){
                if (matriz[i][j].isOcu() == false)
                    aux = aux + "Piso " + (i + 1) + " Plaza " + (j + 1) + ": libre";
                else
                    aux = aux + "Piso " + (i + 1) + " Plaza " + (j + 1) + matriz[i][j].toString();
            }
        }
        return aux;
    }
    
    public String plazaY(int j){
        String aux;
        int cont = 0;
        for (int i = 0; i < piso; i++){
            if (matriz[i][j].isOcu() == true)
                cont++;
        }
        return aux = "La cantidad de autos en la plaza " + j + " son: " + cont;
    }
    
}
/*
Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. De los autos se conoce
nombre del dueño y patente.
a) Genere las clases, incluyendo getters y setters adecuados.
b) Implemente constructores. En particular, para el estacionamiento:
    - Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento
    con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas
    por piso. El estacionamiento inicialmente no tiene autos.
    - Otro constructor debe recibir nombre, dirección, hora de apertura, hora de
    cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el
    estacionamiento con los datos recibidos y sin autos.
c) Implemente métodos para:
    - Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto
    en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir,
    están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado.
    - Dada una patente, obtener un String que contenga el número de piso y plaza
    donde está dicho auto en el estacionamiento. En caso de no encontrarse,
    retornar el mensaje “Auto Inexistente”.
    - Obtener un String con la representación del estacionamiento. Ejemplo: “Piso 1
    Plaza 1: libre Piso 1 Plaza 2: representación del auto …
     Piso 2 Plaza 1: libre … etc”
    - Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha
    plaza (teniendo en cuenta todos los pisos).

d) Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso.
Registre 6 autos en el estacionamiento en distintos lugares.
Muestre la representación String del estacionamiento en consola.
Muestre la cantidad de autos ubicados en la plaza 1.
Lea una patente por teclado e informe si dicho auto se encuentra en el
estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y
plaza que ocupa
*/