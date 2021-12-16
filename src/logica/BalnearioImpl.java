package logica;

import java.util.Scanner;

public class BalnearioImpl implements Balneario{
    private Scanner teclado;
    
    public BalnearioImpl(){
        this.teclado = new Scanner(System.in);
    }

    @Override
    public boolean registrarUsuario() {
        System.out.println("------------------------ Registro ------------------------");
		System.out.println("Ingrese sus Nombre: ");
		String nom = teclado.nextLine();
		System.out.println("Ingrese sus apellido: ");
		String ape = teclado.nextLine();
		System.out.println("Ingrese su correo: ");
		String mail = teclado.nextLine();
		System.out.println("Ingrese su contraseña: ");
		String pass = teclado.nextLine();
        int fono = teclado.nextInt();
        System.out.println("Ingrese su telefono: ");
        System.out.println("----------------------------------------------------------");
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

    @Override
    public void imprimirMenu() {
        System.out.println("---------------------------menu---------------------------");
		System.out.println("opciones: (ingrese su número)");
		System.out.println("OP1: Registrarse");
		System.out.println("OP2: Inicio de Sesion");
		System.out.println("OP3: Finalizar Aplicacion");
		System.out.println("----------------------------------------------------------");
    }
}
