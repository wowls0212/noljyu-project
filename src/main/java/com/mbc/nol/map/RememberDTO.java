package com.mbc.nol.map;

import java.sql.Date;

public class RememberDTO {
	String id, petname, petimg;
	Date deadday, writeday;
	int letternum;
	String lettertitle, letterdetail;
	public RememberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Date getWriteday() {
		return writeday;
	}
	public void setWriteday(Date writeday) {
		this.writeday = writeday;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPetname() {
		return petname;
	}
	public void setPetname(String petname) {
		this.petname = petname;
	}
	public String getPetimg() {
		return petimg;
	}
	public void setPetimg(String petimg) {
		this.petimg = petimg;
	}
	public Date getDeadday() {
		return deadday;
	}
	public void setDeadday(Date deadday) {
		this.deadday = deadday;
	}
	public int getLetternum() {
		return letternum;
	}
	public void setLetternum(int letternum) {
		this.letternum = letternum;
	}
	public String getLettertitle() {
		return lettertitle;
	}
	public void setLettertitle(String lettertitle) {
		this.lettertitle = lettertitle;
	}
	public String getletterdetail() {
		return letterdetail;
	}
	public void setletterdetail(String letterdetail) {
		this.letterdetail = letterdetail;
	}
	
	
}
