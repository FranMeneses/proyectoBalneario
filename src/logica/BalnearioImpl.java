package logica;

import java.util.Scanner;
import java.sql.*;
import java.time.LocalDate;

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
                    if (reservarTemporada(idCliente)) {
                        salir = true;
                    }
                    break;
                case "OP2":
                    if (reservarSemana(idCliente)) {
                        salir = true;
                    }
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
    public boolean reservarTemporada(String idCliente) {
        boolean salir = false;
        String tipo = "temporada";
        String sql = "select * from reserva where idCliente = '"+idCliente+"' and tipo = '"+tipo+"'";
        try {
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()){
                System.out.println("Ya tienes una reserva de este mismo tipo");
                salir = true;
            } else {
                String sql2 = "insert into reserva(idCliente, tipo) values ('"+idCliente+"', '"+tipo+"')";
                try {
                    st.execute(sql2);
                    System.out.println("Reserva registrada correctamente");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return salir;
    }

    @Override
    public boolean reservarSemana(String idCliente) {
        boolean salir = false;
        String tipo = "semana";
        System.out.println("Ingrese la fecha de inicio (yyyy-MM-dd): ");
        String fechaI = teclado.nextLine();
        LocalDate fechaInicio = LocalDate.parse(fechaI);
        System.out.println("Ingrese la fecha de termino (yyyy-MM-dd): ");
        String fechaF = teclado.nextLine();
        LocalDate fechaTermino = LocalDate.parse(fechaF);
        String sql = "select * from reserva where idCliente = '"+idCliente+"' and tipo = '"+tipo+"'";
        try {
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()){
                String sql2 = "select * from semana where idCliente = '"+idCliente+"' and fechaInicio = '"+fechaInicio+"' and fechaTermino = '"+fechaTermino+"'";
                rs = st.executeQuery(sql2);
                if (rs.next()) {
                    System.out.println("Ya tienes una reserva de este mismo tipo en las mismas fechas");
                    salir = true;
                }
            } else {
                String sql3 = "insert into reserva(idCliente, tipo) values ('"+idCliente+"', '"+tipo+"')";
                String sql4 = "insert into semana(idCliente, tipo) values ('"+idCliente+"', '"+tipo+"')";
                try {
                    st.execute(sql3);
                    System.out.println("Reserva registrada correctamente");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return salir;
    }

    @Override
    public boolean reservarDia(String idCliente) {
        return false;
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
