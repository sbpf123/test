package com.bean;


public class Cart {

	private int id;
	private int userid;
	private int bookid;
	private int number;
	private int state;
	private int addressid;
	private String time;
	
	
	public Cart() {
		super();
	}
	public Cart(int id, int userid, int bookid, int number, int state,
			int addressid, String time) {
		super();
		this.id = id;
		this.userid = userid;
		this.bookid = bookid;
		this.number = number;
		this.state = state;
		this.addressid = addressid;
		this.time = time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getAddressid() {
		return addressid;
	}
	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	

	
	
}
