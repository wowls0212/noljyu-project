package com.mbc.nol.product;

public class ProreviewDTO {
	int proreviewnum, productnum;
	String id,proreview,proreviewimg;
	int progroups, prostep, proindent;
	public ProreviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getProreviewnum() {
		return proreviewnum;
	}
	public void setProreviewnum(int proreviewnum) {
		this.proreviewnum = proreviewnum;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProreview() {
		return proreview;
	}
	public void setProreview(String proreview) {
		this.proreview = proreview;
	}
	public String getProreviewimg() {
		return proreviewimg;
	}
	public void setProreviewimg(String proreviewimg) {
		this.proreviewimg = proreviewimg;
	}
	public int getProgroups() {
		return progroups;
	}
	public void setProgroups(int progroups) {
		this.progroups = progroups;
	}
	public int getProstep() {
		return prostep;
	}
	public void setProstep(int prostep) {
		this.prostep = prostep;
	}
	public int getProindent() {
		return proindent;
	}
	public void setProindent(int proindent) {
		this.proindent = proindent;
	}
	
}
