package com.mbc.nol.map;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MapController {
	
	@Autowired
	SqlSession sqlsession;
	String path = "C:/Noljyu/Team-noljyu/src/main/webapp/image";
	
	@RequestMapping(value = "/hospital")
	public String hospital() {
		
		return "hospital";
	}
	
	@RequestMapping(value = "/remember")
	public String remember(Model model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		if(id==null) return "redirect:/login";
		RememberService res = sqlsession.getMapper(RememberService.class);
		RememberDTO dto = res.mypet(id);
		model.addAttribute("dto",dto);
		
		ArrayList<RememberDTO> list = res.letter(id);
		model.addAttribute("list", list);
		
		
		return "remember";
	}
	
	@RequestMapping(value = "/pet")
	public String pet() {
		
		return "pet";
	}
	
	@RequestMapping(value = "petsave")
	public String petsave(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		String id = request.getParameter("id");
		String petname = request.getParameter("petname");
		String deadday = request.getParameter("deadday");
		MultipartFile mf = request.getFile("petimg");
		UUID uu = UUID.randomUUID();
		String petimg = mf.getOriginalFilename();
		petimg = uu.toString()+"-"+petimg;
		mf.transferTo(new File(path+"\\"+petimg));
		RememberService res = sqlsession.getMapper(RememberService.class);
		res.petinsert(id,petname,deadday,petimg);
		return "redirect:/remember";
	}
	
	@RequestMapping(value = "/letter")
	public String letter() {
		return "letter";
	}
	
	@RequestMapping(value = "/lettersave")
	public String lettersave(HttpServletRequest request) {
		String id = request.getParameter("id");
		String lettertitle = request.getParameter("lettertitle");
		String letterdetail = request.getParameter("letterdetail");
		RememberService res = sqlsession.getMapper(RememberService.class);
		res.lettersave(id,lettertitle,letterdetail);
		return "redirect:/remember";
	}
	
	@RequestMapping(value = "/letterdetail")
	public String letterdetail(HttpServletRequest request, Model model) {
		int letternum = Integer.parseInt(request.getParameter("letternum"));
		RememberService res = sqlsession.getMapper(RememberService.class);
		RememberDTO dto = res.letterdetail(letternum);
		model.addAttribute("dto", dto);
		return "letterdetail";
	}

}
