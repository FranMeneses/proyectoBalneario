package logica;

public interface Balneario {
    public boolean registrarUsuario();
    public boolean iniciarSesion();

    public void hacerReserva(String idCliente);
    public void sombrillaGlorieta();
    public void arrendarAdicionales();
    public void cancelarReserva();

    public boolean reservarTemporada(String idCliente);
    public boolean reservarSemana(String idCliente);
    public boolean reservarDia(String idCliente);

    public void imprimirMenu();
    public void menuCliente();
    public void menuReserva();
}
