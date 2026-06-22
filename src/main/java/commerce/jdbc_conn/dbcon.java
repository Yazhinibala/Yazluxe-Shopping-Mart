package commerce.jdbc_conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbcon {

    // ---------------------------------------------------------------
    // CHANGE THESE VALUES to match your MySQL setup
    // ---------------------------------------------------------------
    private static final String DB_URL  = "jdbc:mysql://localhost:3306/commerce_website?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "yazh876#";  // <-- change this
    // ---------------------------------------------------------------

    private static Connection connection = null;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null || connection.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            System.out.println("[YazLuxe] Database connected successfully.");
        }
        return connection;
    }
}
