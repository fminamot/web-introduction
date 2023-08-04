import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLTest {

     public static void main(String[] args) {
          Connection conn;
          Statement stat;
          ResultSet rs;

          try {
               conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost/items?user=user1&password=mypa55");
               try {
                    stat = conn.createStatement();
                    rs = stat.executeQuery("SELECT * FROM Projects" );

                    while( rs.next() ) {
                         System.out.format(
                              "%d, %s, %s\n", rs.getInt(1), rs.getString(2), rs.getString(3)
                         );
                    }
               }
               finally {
                    conn.close();
               }

          } catch (SQLException ex) {
               System.out.println("SQLException: " + ex.getMessage());
               System.out.println("SQLState: " + ex.getSQLState());
               System.out.println("VendorError: " + ex.getErrorCode());
          }
     }
   }

