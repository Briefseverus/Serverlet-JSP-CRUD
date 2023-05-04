package com.example.models;

import java.io.Serializable;
import java.sql.Date;

public class Megazine implements Serializable {
	String ID, title, publisher;

	double price;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Megazine(String iD, String title, String publisher, double price) {
		super();
		ID = iD;
		this.title = title;
		this.publisher = publisher;
		this.price = price;
	}

	public Megazine() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
