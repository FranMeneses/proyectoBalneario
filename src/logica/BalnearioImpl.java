package logica;

import java.util.Scanner;
import java.sql.*;

public class BalnearioImpl implements Balneario{
    private Scanner teclado;
    private conexionsql conn;
    private Connection conexion;
    private java.sql.Statement st;
    
    public BalnearioImpl(){
        this.teclado = new Scanner(System.in);
        this.conn = new conexionsql();
        try {
            this.conexion = conn.conectar();
            this.st = conexion.createStatement();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public boolean registrarUsuario() {
        System.out.println("------------------------ Registro ------------------------");
		System.out.println("Ingrese su Nombre: ");
		String nom = teclado.nextLine();
		System.out.println("Ingrese su apellido: ");
		String ape = teclado.nextLine();
		System.out.println("Ingrese su correo: ");
		String mail = teclado.nextLine();
		System.out.println("Ingrese su contraseña: ");
		String passwrd = teclado.nextLine();
        System.out.println("Ingrese su telefono: ");
        int fono = teclado.nextInt();
        System.out.println("----------------------------------------------------------");
        String sql = "insert into cliente(nombre, apellido, correo, pass, fono) values ('"+nom+"', '"+ape+"', '"+mail+"', '"+passwrd+"', '"+fono+"')";
        try {
            st.execute(sql);
            st.close();
            conexion.close();
            System.out.println("Cliente registrado correctamente");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean iniciarSesion() {
        System.out.println("---------------------- Iniciar Sesion --------------------");
		System.out.println("Ingrese su correo: ");
		String mail = teclado.nextLine();
		System.out.println("Ingrese su contraseña: ");
		String passwrd = teclado.nextLine();
        System.out.println("----------------------------------------------------------");
        String sql = "select * from cliente where correo = '"+mail+"' and pass = '"+passwrd+"'";
        try {
            st.execute(sql);
            st.close();
            conexion.close();
            System.out.println("Cliente encontrado");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public void reservarTemporada() {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void reservarSemana() {
        // TODO Auto-generated method stub
    }

    @Override
    public void reservarDia() {
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

    @Override
    public void menuCliente() {
        System.out.println("--------------------------Cliente-------------------------");
		System.out.println("opciones: (ingrese su número)");
		System.out.println("OP1: Hacer Reserva");
		System.out.println("OP2: Arrendar Sombrilla o Glorieta");
		System.out.println("OP3: Arrendar Elementos Adicionales");
        System.out.println("OP4: Cancelar Reserva");
        System.out.println("OP5: Atras");
		System.out.println("----------------------------------------------------------");
    }
}
