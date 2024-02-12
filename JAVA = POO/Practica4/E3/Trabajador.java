package tema4;

public class Trabajador extends Persona{
    
    private String  trabajo;
    
    public Trabajador (String unNombre, int unDNI, int unaEdad, String unTrabajo){
        super(unNombre, unDNI, unaEdad);
        trabajo = unTrabajo;
    }

    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }
    
    public String toString(){
        String aux = super.toString() + " Soy " + getTrabajo();
        return aux;
    }
    
}
/*
Implemente las clases para el siguiente problema. Una garita de seguridad quiere
identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio pueden
entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores, estos son
personas que se caracterizan además por la tarea realizada en el predio.

Implemente constructores, getters y setters para las clases. Además tanto las personas
como los trabajadores deben responder al mensaje toString siguiendo el formato:

 Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
 Trabajadores “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy jardinero.”

B- Realice un programa que instancie una persona y un trabajador y muestre la
representación de cada uno en consola.

NOTA: Reutilice la clase Persona (carpeta tema2).
*/