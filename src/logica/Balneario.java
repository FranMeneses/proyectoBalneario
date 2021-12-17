package logica;

public interface Balneario {
    public boolean registrarUsuario();
    public boolean iniciarSesion();

    public void hacerReserva(String idCliente);
    public void sombrillaGlorieta();
    public void arrendarAdicionales();
    public void cancelarReserva();

    public void reservarTemporada(String idCliente);
    public void reservarSemana(String idCliente);
    public void reservarDia(String idCliente);

    public void imprimirMenu();
    public void menuCliente();
    public void menuReserva();
}
