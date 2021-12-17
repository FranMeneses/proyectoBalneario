package logica;

import java.util.ArrayList;
import java.util.List;
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
                            cancelarReserva(rs.getString(1));
                            break;
                        case "OP3":
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
                    String idReserva = reservarTemporada(idCliente);
                    // Esto es solo para dejar trabajando el metodo
                    System.out.println("Su reserva temporada: " + idReserva);
                    salir = true;
                    break;
                case "OP2":
                    String idReserva2 = reservarSemana(idCliente);
                    System.out.println("su reserva semana: " + idReserva2);
                    salir = true;
                    sombrillaGlorieta(idCliente);
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
    public void sombrillaGlorieta(String idCliente) {
        // TODO Auto-generated method stub
    }

    @Override
    public void arrendarAdicionales(String idCliente) {
        String reservass = "select idreserva from reserva where idcliente = '"+idCliente+"'";
        String sombrillass = "select idsomglo from reservasomglo where idcliente = '"+idCliente+"'";
        int idReservass = 0;
        int idSomglo = 0;
        
        try{
            ResultSet rs = st.executeQuery(reservass);

            if(rs.next()){
                idReservass = rs.getInt(0);
                try{
                    rs = st.executeQuery(sombrillass);
                    if(rs.next()){
                        idSomglo = rs.getInt(2);
                    }
                    System.out.println("Cuantas Camas desea reservar?(0 para ninguna) ");
                    int camass = teclado.nextInt();
                    System.out.println("Cuantas Sillas desea reservar?(0 para ninguna) ");
                    int sillass = teclado.nextInt();
                    System.out.println(("Cuantas Tumbonas desea reservar?(0 para ninguna)"));
                    int tumbonass = teclado.nextInt();
                    String ingreso = ("insert into reservaadicionales (idreserva, idcliente, idsomglo, camas, sillas, tumbonas) values ('"+idReservass+"','"+idCliente+"','"+idSomglo+"','"+camass+"','"+sillass+"','"+tumbonass+"')");
                    st.executeQuery(ingreso);

                    rs.close();
                    st.close();
                    conexion.close();
                }catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void cancelarReserva (String idCliente){
        
        String R = "select * from reserva where idCliente = '"+idCliente+"'";
        
        try {
            //  Block of code to try
            ResultSet rs = st.executeQuery(R);
            
            System.out.println("Reservas");
            System.out.println("ID Reserva - Tipo");

            List<String> listaID = new ArrayList<>();
            int cont = 0;

            while (rs.next()) {
                System.out.println(rs.getString(1)+" - "+rs.getString(3));
                String p = rs.getString(1);

                listaID.add(p);
                cont+=1;
            }
            if (cont == 0){
                System.out.println("No existen reservas para eliminar");
            }
            else{            
                boolean v=false;
                int pp=0;
                while (!v){
                    System.out.println("Ingresar ID Reserva para eliminar:");
                    String idR = teclado.nextLine();
                    for (int x = 0; x < listaID.size(); x++){
                        if (idR.equals(listaID.get(x))){
                            String R_estacionamiento = "DELETE FROM reservaEstacionamiento WHERE idReserva = '"+idR+"'";
                            String R_adicional = "DELETE FROM reservaAdicionales WHERE idReserva ='"+idR+"'";
                            String R_somglo = "DELETE FROM reservaSomGlo WHERE idReserva ='"+idR+"'";
                            String R_dia = "DELETE FROM dia WHERE idReserva ='"+idR+"'";
                            String R_semana = "DELETE FROM semana WHERE idReserva ='"+idR+"'";
                            String R_reserva = "DELETE FROM reserva WHERE idReserva ='"+idR+"'";

                            st.execute(R_estacionamiento);
                            st.execute(R_adicional);
                            st.execute(R_somglo);
                            st.execute(R_dia);
                            st.execute(R_semana);
                            st.execute(R_reserva);

                            v=true;
                            pp+=1;

                        }
                    }
                    if (pp==0) {
                        System.out.println("Error. Re-intenten.");
                    }
                    else{
                        break;
                    }
                }
            }  
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }       
    }

    @Override
    public String reservarTemporada(String idCliente) {
        String valor = null;
        String tipo = "temporada";
        String sql = "select * from reserva where idCliente = '"+idCliente+"' and tipo = '"+tipo+"'";
        try {
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()){
                System.out.println("Ya tienes una reserva de este mismo tipo");
            } else {
                String sql2 = "insert into reserva(idCliente, tipo) values ('"+idCliente+"', '"+tipo+"')";
                try {
                    st.execute(sql2);
                    String sql3 = "select * from reserva where idCliente = '"+idCliente+"' and tipo = '"+tipo+"'";
                    rs = st.executeQuery(sql3);
                    rs.next();
                    valor = rs.getString(1); //Extraigo la idReserva
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
        return valor;
    }

    @Override
    public String reservarSemana(String idCliente) {
        String valor = null;
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
            // Comprueba que el cliente no tenga otra reserva esa misma semana
            if (rs.next()){
                String sql2 = "select * from semana where idCliente = '"+idCliente+"' and fechaInicio = '"+fechaInicio+"' and fechaTermino = '"+fechaTermino+"'";
                rs = st.executeQuery(sql2);
                if (rs.next()) {
                    LocalDate fecha1 = LocalDate.parse(rs.getString(3));
                    LocalDate fecha2 = LocalDate.parse(rs.getString(4));
                    String sql6 = "select (date '"+fechaInicio+"', date '"+fechaTermino+"') OVERLAPS (date '"+fecha1+"', date '"+fecha2+"')";
                    ResultSet rs3 = st.executeQuery(sql6);
                    if (rs3.next()) {
                        System.out.println("Ya tienes una reserva de este mismo tipo en las mismas fechas");
                        return valor;
                    }
                }
            } else {
                // Realiza el Ingreso a la base de datos
                String sql3 = "insert into reserva(idCliente, tipo) values ('"+idCliente+"', '"+tipo+"')";
                try {
                    st.execute(sql3);
                    String sql4 = "select * from reserva where idCliente = '"+idCliente+"' and tipo = '"+tipo+"'";
                    ResultSet rs2 = st.executeQuery(sql4);
                    if (rs2.next()){
                        String idReserva = rs2.getString(1);
                        String sql5 = "insert into semana(idReserva, idCliente, fechaInicio, fechaTermino) values ('"+idReserva+"', '"+idCliente+"', '"+fechaInicio+"', '"+fechaTermino+"')";
                        st.execute(sql5);
                        valor = idReserva;
                        System.out.println("Reserva registrada correctamente");
                    }
                    rs2.close();
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
        return valor;
    }

    @Override
    public void reservarDia(String idCliente) {
        System.out.println("Ingrese dia de reserva (yyyy-mm-dd): ");
        String dia = teclado.nextLine();

        try {
            ResultSet rs3 = st.executeQuery("SELECT MAX(idReserva) as cant FROM reserva");
            while (rs3.next()) {
                int cant = rs3.getInt("cant") + 1;
                String sql = "INSERT INTO reserva (idReserva, idCliente, tipo) VALUES ('" + cant + "', '" + idCliente
                        + "','dia')";
                st.execute(sql);
                String sql2 = "INSERT INTO dia (idReserva, idCliente, fechaDia) VALUES ('" + cant
                        + "', '"
                        + idCliente
                        + "','" + dia + "')";
                st.execute(sql2);
                System.out.println("reserva creada");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
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
        System.out.println("OP2: Cancelar Reserva");
        System.out.println("OP3: Atras");
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
