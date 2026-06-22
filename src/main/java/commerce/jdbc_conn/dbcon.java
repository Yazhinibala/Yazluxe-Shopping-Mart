/*package commerce.jdbc_conn;

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
*/

package commerce.jdbc_conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbcon {

    private static Connection connection = null;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {

        if (connection == null || connection.isClosed()) {

            String host = System.getenv("MYSQLHOST");
            String port = System.getenv("MYSQLPORT");
            String database = System.getenv("MYSQLDATABASE");
            String user = System.getenv("MYSQLUSER");
            String password = System.getenv("MYSQLPASSWORD");

            String url =
                "jdbc:mysql://" + host + ":" + port + "/" + database +
                "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(
                url,
                user,
                password
            );

            System.out.println("[YazLuxe] Railway database connected successfully.");
        }

        return connection;
    }
}