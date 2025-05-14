package com.mbc.nol.customer;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CusController {
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "noticewrite")
	public String nw() {
		
		return "noticewrite";
	}
	
	@RequestMapping(value = "noticesave")
	public String nsave(HttpServletRequest request)  {
		String ntitle = request.getParameter("ntitle");
		String ndetail = request.getParameter("ndetail");
		CusService cs = sqlsession.getMapper(CusService.class);
		cs.nsave(ntitle, ndetail);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "noticedetail")
	public String no(HttpServletRequest request, Model model) {
		CusService cs = sqlsession.getMapper(CusService.class);
		CusDTO dto = cs.nout();
		cs.nc(1);
		model.addAttribute("dto", dto);
		return "noticedetail";
	}
	
	
	
}
