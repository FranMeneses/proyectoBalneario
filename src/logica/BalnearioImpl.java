package logica;

import java.util.Scanner;

public class BalnearioImpl implements Balneario{
    private Usuario user;
    private Scanner teclado;
    
    public BalnearioImpl(){
        this.user = null;
        this.teclado = new Scanner(System.in);
    }

    @Override
    public boolean registrarUsuario() {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean iniciarSesion() {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public void comprarAbono() {
        // TODO Auto-generated method stub
        
    }
}
