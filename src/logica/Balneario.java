package logica;

public interface Balneario {
    public boolean registrarUsuario();
    public boolean iniciarSesion();

    public void reservarTemporada();
    public void reservarSemana();
    public void reservarDia();

    public void imprimirMenu();
    public void menuCliente();
}
