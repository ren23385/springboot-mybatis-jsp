package com.demo.model;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Size;

public class Book implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;

	@Size(max=20,min=2,message="{require.book.name}")
	private String name;
	private int tid;
	private String descri;
	
	@Size(max=50,min=2,message="{require.book.factor}")
	private String factor;

	private Date pubdate;
	private String date;

	private double price;

	private String photo;
	
	@Size(min=4,max=4,message="{require.book.vcode}")
	private String vcode;
	
	private Type type;

	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String name, int tid, String descri, String factor, Date pubdate, double price, String photo) {
		super();
		this.name = name;
		this.tid = tid;
		this.descri = descri;
		this.factor = factor;
		this.pubdate = pubdate;
		this.price = price;
		this.photo = photo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getDescri() {
		return descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

	public String getFactor() {
		return factor;
	}

	public void setFactor(String factor) {
		this.factor = factor;
	}

	public Date getPubdate() {
		return pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", tid=" + tid + ", descri=" + descri + ", factor=" + factor
				+ ", pubdate=" + pubdate + ", price=" + price + ", photo=" + photo + "]";
	}

}
