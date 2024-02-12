package tema3;

public class Autor {
    
    private String nom;
    private String bio;
    private String origen;
    
    public Autor(){
        
    }
    
    public Autor(String unNom, String unaBio, String unOrigen){
        nom = unNom;
        bio = unaBio;
        origen = unOrigen;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getNom() {
        return nom;
    }

    public String getBio() {
        return bio;
    }

    public String getOrigen() {
        return origen;
    }
    
}
