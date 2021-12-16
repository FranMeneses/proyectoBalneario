package logica;

import java.sql.*;

public class conexionsql {
    private Connection conn = null;
    private String url = "jdbc:postgresql://localhost:5432/roquerioDB";
    private String user = "postgres";
    private String pass = "BKsec1paSS";

    public Connection conectar() {
        //Acceso a la Base de Datos
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, user, pass);
            System.out.println("Conectado con éxito a la base de datos");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
}
