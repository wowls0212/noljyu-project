package com.mbc.nol.user;

public class UserDTO {
	String id,pw,name,address,phone,nickname,myanimal;
	String admin;
	String petName;
	String photo;
	public UserDTO() {}
	public UserDTO(String id, String pw, String name, String address, String phone, String nickname, String myanimal,
			String admin, String petName, String photo) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.nickname = nickname;
		this.myanimal = myanimal;
		this.admin = admin;
		this.petName = petName;
		this.photo = photo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMyanimal() {
		return myanimal;
	}
	public void setMyanimal(String myanimal) {
		this.myanimal = myanimal;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
