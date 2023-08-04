import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTest {

    public static void main(String[] args) {
        System.out.println("JDBC test");

        Connection connection;

        try {
             connection = DriverManager.getConnection(
                  "jdbc:mysql://localhost/items?user=user1&password=mypa55");
             try {
                 Statement statement = connection.createStatement();
                 ResultSet rs = statement.executeQuery("SELECT * FROM Projects" );

                 while( rs.next() ) {
                     System.out.println(
                         "Record=(" + rs.getInt(1) + "," + rs.getString(2) + "," + rs.getString(3) + ")"
                     );
                  }
             }
             finally {
                 connection.close();
             }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}

