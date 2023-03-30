package com.javaEE.flixStar.model;

public class Admin extends User{
	
	private int adminId = 0;

	public Admin(String userName, String password, String adminType, int adminId) {
		super(userName, password, adminType);
		this.adminId = adminId;
	}

	public Admin(String userName, String password) {
		// TODO Auto-generated constructor stub
		super(userName, password);
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	
	

}
