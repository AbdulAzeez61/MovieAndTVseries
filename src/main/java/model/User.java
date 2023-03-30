package model;

public class User {

	private String username;
	private String email;
	private String password;
	
	public User(String name, String email2, String password2) {
		// TODO Auto-generated constructor stub
		super();
		this.username = name;
		this.email = email2;
		this.password = password2;
	}
	public String getUsername() {
		return username;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password; 
	}
}
