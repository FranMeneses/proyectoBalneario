package logica;

public class Usuario {
    private String nombre;
    private String correo;
    private String pass;
    private char sexo;

    public Usuario(String nombre, String correo, String pass, char sexo){
        this.nombre = nombre;
        this.correo = correo;
        this.pass = pass;
        this.sexo = sexo;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return this.correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPass() {
        return this.pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public char getSexo() {
        return this.sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

}
