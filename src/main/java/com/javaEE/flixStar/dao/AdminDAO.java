package com.javaEE.flixStar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.javaEE.flixStar.model.Admin;


public class AdminDAO {

	private Connection conn;
	private String query;
    private PreparedStatement pst;
    
    public AdminDAO(Connection conn) {
    	this.conn = conn;
    }
    
    public Admin login(Admin admin) {

          Admin user = null;
          
          try {
        	  query = "select * from administrator where auname =? AND password =?";
          	  pst = this.conn.prepareStatement(query);
        	  
          	  pst.setString(1, admin.getUserName());
          	  pst.setString(2, admin.getPassword());
          	  
              ResultSet rs = pst.executeQuery();
              
              if(rs.next()) {
            	  String uname = rs.getString("auname");
            	  String password = rs.getNString("password");
            	  user = new Admin(uname, password);
              }
          }    
          catch (Exception e) {
        	  e.printStackTrace();
          }
          
          
          return user;
    	
    }
	
}
