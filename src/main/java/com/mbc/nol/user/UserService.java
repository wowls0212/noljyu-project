package com.mbc.nol.user;

import org.apache.ibatis.annotations.Param;
import java.util.ArrayList;

public interface UserService {

	int idcount(String id);

	void insertq(String id, String pw, String name, String address, String phone, String nickname, String myanimal, String admin, String petName, String photo);

	ArrayList<UserDTO> allout(UserPageDTO dto);

	ArrayList<UserDTO> searcha(@Param("cate") String cate, @Param("scearch") String scearch);

	UserDTO getuser(String id);

	UserDTO modify1(String id);

	void modify2(String id, String pw, String name, String address, String phone, String nickname, String myanimal, String petName);

	UserDTO delete1(String id);

	void delete2(String id);
	
	String getAdminPassword();

	int nicknamecount(String nickname);
	
    void modifyPassword(@Param("id") String id,@Param("pw") String pw);

	void modify3(String id, String encodedPw);
	
	void modifyWithPhoto(String id, String pw, String name, String address, String phone, String nickname,
            String myanimal, String petName, String petimg);

	int usertotal();

	int usersearchtotal();

}
