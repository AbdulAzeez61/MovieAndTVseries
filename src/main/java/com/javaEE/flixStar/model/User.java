package com.javaEE.flixStar.model;

public class User {

    private String userName;
    private String password;
	private String adminType;
	
	
	
	public User(String userName, String password, String adminType) {
		super();
		this.userName = userName;
		this.password = password;
		this.adminType = adminType;
	}
	
	public User(String userName, String password) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdminType() {
		return adminType;
	}
	public void setAdminType(String adminType) {
		this.adminType = adminType;
	}
    
	
}
