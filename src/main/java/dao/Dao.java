package dao;
import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.User;

public class Dao {

	public void registerUser(User user) throws ClassNotFoundException{
		
		String INSERT_USERS_SQL = "INSERT INTO new_t" + " (una, pwd, ema) VALUES " + " ( ?,?,?);";

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.
				getConnection("jdbc:mysql://localhost:3306/flixstar","root","ITSMETERRA@123");

		// creating a statement using connection object

		PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
		preparedStatement.setString( 1, user.getUsername());
		preparedStatement.setString( 2, user.getPassword());
		preparedStatement.setString( 3, user.getEmail());
	    System.out.println(preparedStatement);
		preparedStatement.executeUpdate();
		
	} catch (SQLException e){
		e.printStackTrace();
	}
}
	public void deleteuser(User user) throws ClassNotFoundException {

		String DELETE_USERS_SQL = "DELETE FROM  new_t WHERE username=?;";

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.
				getConnection("jdbc:mysql://localhost:3306/flixstar","root","ITSMETERRA@123");

		// creating a statement using connection object

		PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL)) {
		preparedStatement.setString( 1, user.getUsername());
	    System.out.println(preparedStatement);
		preparedStatement.executeQuery();
		
	} catch (SQLException e){
		e.printStackTrace();
	}
		
		
	}
}