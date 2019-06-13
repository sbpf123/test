package com.bean;


public class User {

	private int id;
	private String username;
	private String password;
	private String per;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPer() {
		return per;
	}
	public void setPer(String per) {
		this.per = per;
	}
	public User() {
		super();
		this.username ="";
		this.password = "";
		this.per = "";
	}
	public User(int id, String username, String password, String per) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.per = per;
	}

	
}
