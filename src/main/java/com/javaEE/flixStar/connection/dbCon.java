package com.javaEE.flixStar.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
/**
 * This class is used to create a JDBC 
 * connection with MySql DB.
 * @author w3spoint
 */
public class dbCon {
	//JDBC and database properties.
	private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/flixstar";
	private static final String DB_USERNAME = "root";
	private static final String DB_PASSWORD = "ITSMETERRA@123";
 
	public static Connection getConnection() throws SQLException{
		Connection conn = null;
		
		try{
			//Register the JDBC driver
			Class.forName(DB_DRIVER);
 
			//Open the connection
			conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
 
			if(conn != null){
			   System.out.println("Successfully connected.");
			   
			}else{
			   System.out.println("Failed to connect.");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
	}	
}