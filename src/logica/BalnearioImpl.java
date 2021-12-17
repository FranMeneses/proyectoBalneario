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
        boolean sesion = false;
        System.out.println("---------------------- Iniciar Sesion --------------------");
		System.out.println("Ingrese su correo: ");
		String mail = teclado.nextLine();
		System.out.println("Ingrese su contraseña: ");
		String passwrd = teclado.nextLine();
        System.out.println("----------------------------------------------------------");
        String sql = "select idCliente from cliente where correo = '"+mail+"' and pass = '"+passwrd+"'";
        try {
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                System.out.println("Sesion Iniciada");
                boolean salir = false;
                while(!salir){
                    menuCliente();
                    String op = teclado.nextLine();

                    while(!op.equals("OP1") && !op.equals("OP2") && !op.equals("OP3") && !op.equals("OP4") && !op.equals("OP5")){
					System.out.println("Ingrese la opción correcta");
					menuCliente();
					op = teclado.nextLine();
					}

                    switch(op) {
                        case "OP1":
                            // Le paso la idCliente con rs
                            hacerReserva(rs.getString(1));
                            break;
                        case "OP2":
                            break;
                        case "OP3":
                            break;
                        case "OP4":
                            break;
                        case "OP5":
                            salir = true;
                            break;
                    }
                }
                sesion = true;
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return sesion;
    }

    @Override
    public void hacerReserva(String idCliente) {
        boolean salir = false;
        while(!salir){
            menuReserva();
            String op = teclado.nextLine();

            while(!op.equals("OP1") && !op.equals("OP2") && !op.equals("OP3") && !op.equals("OP4")){
            System.out.println("Ingrese la opción correcta");
            menuReserva();
            op = teclado.nextLine();
            }

            switch(op) {
                case "OP1":
                    reservarTemporada(idCliente);
                    break;
                case "OP2":
                    reservarSemana(idCliente);
                    break;
                case "OP3":
                    reservarDia(idCliente);
                    break;
                case "OP4":
                    salir = true;
                    break;
            }
        }
    }

    @Override
    public void sombrillaGlorieta() {
        // TODO Auto-generated method stub
    }

    @Override
    public void arrendarAdicionales() {
        // TODO Auto-generated method stub
    }

    @Override
    public void cancelarReserva() {
        // TODO Auto-generated method stub
    }

    @Override
    public void reservarTemporada(String idCliente) {
        // TODO Auto-generated method stub
    }

    @Override
    public void reservarSemana(String idCliente) {
        // TODO Auto-generated method stub
    }

    @Override
    public void reservarDia(String idCliente) {
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

    @Override
    public void menuReserva() {
        System.out.println("--------------------------Reserva-------------------------");
		System.out.println("opciones: (ingrese su número)");
		System.out.println("OP1: Reservar Temporada Completa");
		System.out.println("OP2: Reservar Semana");
		System.out.println("OP3: Reservar Dia");
        System.out.println("OP4: Atrás");
		System.out.println("----------------------------------------------------------");
    }
}
