package com.bean;


public class Book {

	private int id;
	private String isbn;
	private String name;
	private String author;
	private String pricep;//购入价格
	private String prices;//卖出价格
	private String publish;//出版
	private String number;//数量
	
	
	public Book(int id, String isbn, String name, String author, String pricep,
			String prices, String publish, String number) {
		super();
		this.id = id;
		this.isbn = isbn;
		this.name = name;
		this.author = author;
		this.pricep = pricep;
		this.prices = prices;
		this.publish = publish;
		this.number = number;
	}
	public Book() {
		super();
		this.isbn ="";
		this.name = "";
		this.author = "";
		this.pricep = "";
		this.prices = "";
		this.publish = "";
		this.number = "";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPricep() {
		return pricep;
	}
	public void setPricep(String pricep) {
		this.pricep = pricep;
	}
	public String getPrices() {
		return prices;
	}
	public void setPrices(String prices) {
		this.prices = prices;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}

	
	
}
