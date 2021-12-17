package logica;

public interface Balneario {
    public boolean registrarUsuario();
    public boolean iniciarSesion();

    public void hacerReserva(String idCliente);
    public void sombrillaGlorieta(String idCliente);
    public void arrendarAdicionales();
    public void cancelarReserva();

    public String reservarTemporada(String idCliente);
    public String reservarSemana(String idCliente);
    public String reservarDia(String idCliente);

    public void imprimirMenu();
    public void menuCliente();
    public void menuReserva();
}
