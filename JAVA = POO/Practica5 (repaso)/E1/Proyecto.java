package tema5;

public class Proyecto {
    
    private String nom;
    private int cod;
    private String dir;
    private Investigador [] I;
    private int dimF, dimL;
    
    public Proyecto(String unNom, int unCod, String unDir){
        nom = unNom;
        cod = unCod;
        dir = unDir;
        dimF = 50;
        dimL = 0;
        I = new Investigador [dimF];
    }

    public String getNom() {
        return nom;
    }

    public int getCod() {
        return cod;
    }

    public String getDir() {
        return dir;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }
    
    public void agregarInvestigador(Investigador inv){
        I[dimL] = inv;
        dimL++;
    }
    
    public double dineroTotalOtorgado(){
        double aux = 0;
        for (int i = 0; i < dimL; i++)
            aux = aux + I[i].devolverSubsidio();
        return aux;
    }
    
    public void otorgarTodos (String nombre){
        int i = 0;
        while ((i < dimL) && (!I[i].getNom().equals(nombre)))
            i++;
        if (I[i].getNom().equals(nombre))
            I[i].otorgar();
    }
    
    @Override
    public String toString(){
        String aux = "Nombre: " + getNom() + ", codigo: " + getCod() + ", director: " + getDir() + ", dinero total: " + dineroTotalOtorgado();
        for (int i = 0; i < this.dimL; i++){
            aux = aux + " Nombre inv: " + I[i].getNom() + ", categoria " + I[i].getCat() + ", especialidad " + I[i].getEsp() + ", dinero dado " + I[i].devolverSubsidio();
        }
        return aux;
    }
    
    
    
}
/*
- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto
tiene: nombre, código, nombre completo del director y los investigadores que participan
en el proyecto (50 como máximo). De cada investigador se tiene: nombre completo,
categoría (1 a 5) y especialidad. Además, cualquier investigador puede pedir hasta un
máximo de 5 subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.

i) Implemente el modelo de clases teniendo en cuenta:
    a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
    director.
    b. Un investigador sólo debería poder construirse con nombre, categoría y
    especialidad.
    c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
    Un subsidio siempre se crea en estado no-otorgado.

ii) Implemente los métodos necesarios (en las clases donde corresponda) que permitan:
    a. void agregarInvestigador(Investigador unInvestigador);
    // agregar un investigador al proyecto.
    b. void agregarSubsidio(Subsidio unSubsidio);
    // agregar un subsidio al investigador.
    c. double dineroTotalOtorgado();
    //devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
    todos los subsidios otorgados de todos los investigadores)
    d. void otorgarTodos(String nombre_completo);
    //otorgar todos los subsidios no-otorgados del investigador llamado
    nombre_completo
    e. String toString();
    // devolver un string con: nombre del proyecto, código, nombre del director, el
    total de dinero otorgado del proyecto y la siguiente información de cada
    investigador: nombre, categoría, especialidad, y el total de dinero de sus
    subsidios otorgados.

iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
todos los datos del proyecto en pantalla.
*/