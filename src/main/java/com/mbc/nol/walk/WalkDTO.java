package com.mbc.nol.walk;

import java.sql.Date;

public class WalkDTO {
	int walknum;
	String id,walktitle,walkdetail,walkimg;
	int walkcnt;
	Date walkdate;
	String walkwritetitle, walkwritedetail;
	public WalkDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getWalkwritetitle() {
		return walkwritetitle;
	}

	public void setWalkwritetitle(String walkwritetitle) {
		this.walkwritetitle = walkwritetitle;
	}

	public String getWalkwritedetail() {
		return walkwritedetail;
	}

	public void setWalkwritedetail(String walkwritedetail) {
		this.walkwritedetail = walkwritedetail;
	}

	public int getWalknum() {
		return walknum;
	}
	public void setWalknum(int walknum) {
		this.walknum = walknum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWalktitle() {
		return walktitle;
	}
	public void setWalktitle(String walktitle) {
		this.walktitle = walktitle;
	}
	public String getWalkdetail() {
		return walkdetail;
	}
	public void setWalkdetail(String walkdetail) {
		this.walkdetail = walkdetail;
	}
	public String getWalkimg() {
		return walkimg;
	}
	public void setWalkimg(String walkimg) {
		this.walkimg = walkimg;
	}
	public int getWalkcnt() {
		return walkcnt;
	}
	public void setWalkcnt(int walkcnt) {
		this.walkcnt = walkcnt;
	}
	public Date getWalkdate() {
		return walkdate;
	}
	public void setWalkdate(Date walkdate) {
		this.walkdate = walkdate;
	}

}
