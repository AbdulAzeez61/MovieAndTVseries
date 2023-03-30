package review.dao;
import java.sql.*;

public class ConnectionDao {
	
	 //Contains all the JDBC related code and to separate all DB related stuff to a separate class 

		//Class provides CRUD database operations for the table reviews in the database
		
		private static Connection con;
		
		public static Connection getCon() {
			
			try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flixstar","root","ITSMETERRA@123"); //Passing JDBC connection name, username and password
			} 
			
			catch(Exception e) {
				
				e.printStackTrace();
			}
			
			
			return con;
		}
	
	
	
	

}
