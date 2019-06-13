package com.bean;


public class Feedback {

	private int id;
	private String tite;
	private String content;
	private String username;
	private String time;
	
	
	public Feedback() {
		super();
	}
	public Feedback(int id, String tite, String content, String username,
			String time) {
		super();
		this.id = id;
		this.tite = tite;
		this.content = content;
		this.username = username;
		this.time = time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTite() {
		return tite;
	}
	public void setTite(String tite) {
		this.tite = tite;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	
	
	
	
	
	
}
