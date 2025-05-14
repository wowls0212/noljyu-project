package com.mbc.nol.adoption;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdoptionController {

	@Autowired
	SqlSession sqlsession;
	String path = "C:/Noljyu/Team-noljyu/src/main/webapp/image";
	
	@RequestMapping(value = "/adoption")
	public String adop() {
		
		return "adoptionout";
	}
}
