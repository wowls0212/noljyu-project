package com.mbc.nol.map;

import java.util.ArrayList;

public interface RememberService {

	void petinsert(String id, String petname, String deadday, String petimg);

	RememberDTO mypet(String id);

	void lettersave(String id, String lettertitle, String letterdetail);

	ArrayList<RememberDTO> letter(String id);

	RememberDTO letterdetail(int letternum);

}
