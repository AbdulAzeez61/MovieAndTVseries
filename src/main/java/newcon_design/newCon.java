/*
 * package newcon_design; import java.sql.Connection; import
 * java.sql.DriverManager; import java.sql.SQLException;
 * 
 * 
 * public class newCon {
 * 
 * 
 * 
 * private static Connection connection;
 * 
 * 
 * private newCon() {} //use of singleton design pattern
 * 
 * public static Connection getDBConnection() throws ClassNotFoundException,
 * SQLException {
 * 
 * This create new connection objects when connection is closed or it is null
 * 
 * if (connection == null || connection.isClosed()) {
 * Class.forName("com.mysql.jdbc.Driver"); connection =
 * DriverManager.getConnection("jdbc:mysql://localhost:3306/flixstar", "root",
 * "ITSMETERRA@123"); } return connection; }
 * 
 * 
 * 
 * }
 * 
 * 
 * 
 * 
 * 
 * 
 */