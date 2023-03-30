package com.javaEE.flixStar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.javaEE.flixStar.model.Movie;
import com.javaEE.flixStar.model.Users;

public class UserDAO {

	private Connection conn;
	private String query;
    private PreparedStatement pst;
    
    public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}	 
    
    public boolean  editUser(Users users) {
    	
    	boolean test = false;
    	
    	System.out.println("edit User executed");
    	System.out.println(users.getUserServer());
    	
    	try {
    		 query = "update new_t set pwd=?, ema=? WHERE una = ?";
    		pst = this.conn.prepareStatement(query);
    		
    		pst.setString(1, users.getPassword());
        	pst.setString(2, users.getEmail());
        	pst.setString(3, users.getUsername());
        	
        	pst.executeUpdate();
        	
        	System.out.println("I am from Userdao edit");
           test = true;
           conn.close();
    		
    	} catch(Exception e) {
    		
    		e.printStackTrace();
    	}
    	
  
    	
		return test;
    }
    
public Users getUser(String uname) {
		
		Users user = null;
		
		try {
			String query = "select * from new_t where una = ?";
			PreparedStatement pst = this.conn.prepareStatement(query);		
			pst.setString(1, uname);
			ResultSet rs = pst.executeQuery(); //row data
			
			while(rs.next()) {
				String username = rs.getString("una");
				String email = rs.getString("pwd");
				String password = rs.getString("ema");	
			
				user = new Users(username,email,password) ;		    
				conn.close();
				System.out.println(username + email +password);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
    
    public List<Users> getAllusers() {
		
		 List<Users> users = new ArrayList<>();
		 
		 System.out.print("get AllUsers Called");
		 
		 try {
			 String query = "select una,pwd,ema from new_t order by una";
			 PreparedStatement pt = this.conn.prepareStatement(query);
			 ResultSet rs = pt.executeQuery();
			 while(rs.next()) {				 
				 String uname = rs.getString("una");
				 String pwd = rs.getString("pwd");
				 String email = rs.getString("ema");
			 
				 Users row = new Users(uname,pwd,email);
				 users.add(row);
				 
				 System.out.print(row);	 
				 
			 }
			 
			 conn.close();
		 } catch (Exception e) {
			 e.printStackTrace();
		 }	 
		 return users;
	 }
    
    public void deleteUser(String uname) {
    	System.out.println("User Deleted Called" + uname);
    	
    	try {
    		String query = "delete from new_t where una=?";
    		PreparedStatement pst = this.conn.prepareStatement(query);
    		
    		pst.setString(1,uname);
    		pst.execute();
    		
    		System.out.println("Execute");
    		
    		conn.close();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
}
