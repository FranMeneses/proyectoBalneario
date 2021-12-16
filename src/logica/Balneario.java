package logica;

public interface Balneario {
    public boolean registrarUsuario();
    public boolean iniciarSesion();

    public void hacerReserva();
    public void sombrillaGlorieta();
    public void arrendarAdicionales();
    public void cancelarReserva();

    public void reservarTemporada();
    public void reservarSemana();
    public void reservarDia();

    public void imprimirMenu();
    public void menuCliente();
}
