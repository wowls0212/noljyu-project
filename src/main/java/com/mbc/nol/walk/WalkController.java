package com.mbc.nol.walk;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbc.nol.report.ReportPageDTO;
import com.mbc.nol.report.ReportService;


@Controller
public class WalkController {

	@Autowired
	SqlSession sqlsession;
	String path="C:\\Noljyu\\Team-noljyu\\src\\main\\webapp\\image";
	
	@RequestMapping(value = "walkinput")
	public String hh1() {
		return "walkinput";
	}
	
	@RequestMapping(value = "walksave")
	public String hh2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String id=mul.getParameter("id");
		String walktitle=mul.getParameter("walktitle");
		String walkdetail=mul.getParameter("walkdetail");
		MultipartFile mf = mul.getFile("walkimg");
		String walkimg=mf.getOriginalFilename();
		UUID uu = UUID.randomUUID();
		walkimg=uu.toString()+"="+walkimg;
		System.out.println(id+" "+walktitle+" "+walkdetail+ " "+walkimg);
		WalkService ws = sqlsession.getMapper(WalkService.class);
		ws.walkinsert(id,walktitle,walkdetail,walkimg);
		
		mf.transferTo(new File(path+"\\"+walkimg));
		
		return "redirect:/main";
	}
	
	@RequestMapping(value = "walkout")
	public String hh3(Model model, HttpServletRequest request, WalkPageDTO dto) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
        WalkService ws = sqlsession.getMapper(WalkService.class);
		
        //전체 레코드 수 구하기 
        int total=ws.walktotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="6";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="6";
        }
        dto = new WalkPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		model.addAttribute("list", ws.walkout(dto));
		model.addAttribute("paging", dto);
		return "walkout";
	}
	
	@RequestMapping(value = "walkdetail")
	public String hh4(HttpServletRequest request, Model model) {
		int walknum = Integer.parseInt(request.getParameter("walknum"));
		WalkService ws = sqlsession.getMapper(WalkService.class);
		ws.updateWalkCnt(walknum);
		WalkDTO dto = ws.walkdetailout(walknum);
		model.addAttribute("dto", dto);
		return "walkdetail";
	}
	
	
	@RequestMapping(value = "/walkupdate")
	public String walkupdate(HttpServletRequest request, Model model) {
		int walknum = Integer.parseInt(request.getParameter("walknum"));
		WalkService ws = sqlsession.getMapper(WalkService.class);
		WalkDTO dto = ws.walkupdateout(walknum);
		model.addAttribute("dto", dto);
		return "walkupdate";
	}
	
	@RequestMapping(value = "/walkupdatesave")
	public String walkupdatesave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int walknum=Integer.parseInt(mul.getParameter("walknum"));
		String walktitle=mul.getParameter("walktitle");
		String walkdetail=mul.getParameter("walkdetail");
		
		MultipartFile mf = mul.getFile("walkimg");
		String walkimg = mf.getOriginalFilename();
		UUID uu = UUID.randomUUID();
		walkimg=uu.toString()+"-"+walkimg;
		
		String walkoldimg = mul.getParameter("walkoldimg");
		WalkService ws = sqlsession.getMapper(WalkService.class);
		
		if (mf == null || mf.isEmpty()) {
			ws.walkupdate(walknum,walktitle,walkdetail);
		}
		else {
			ws.walkupdateimg(walknum,walktitle,walkdetail,walkimg);
			mf.transferTo(new File(path+"\\"+walkimg));
			File ff = new File(path+"\\"+walkoldimg);
			ff.delete();
		}
		
		return "redirect:/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/walkdelete")
	public String walkdelete(int walknum, HttpServletResponse response, HttpServletRequest request) {
		WalkService ws = sqlsession.getMapper(WalkService.class);
		ws.walkdelete(walknum);
		int count = ws.walkdeletecheck(walknum);
		String bigo="";
		if (count == 0 ) bigo = "success";
		else bigo = "fail";
		return bigo;
	}
	
	//게시글 검색
	@RequestMapping(value = "/walksearch")
	public String walksearch(HttpServletRequest request,Model model) {
		String walkkey = request.getParameter("walkkey");
		String walkvalue = request.getParameter("walkvalue");
		WalkService ws = sqlsession.getMapper(WalkService.class);
		ArrayList<WalkDTO> list = ws.walksearch(walkkey,walkvalue);
		model.addAttribute("list", list);
		model.addAttribute("walkvalue", walkvalue);
		return "walksearch";
	}
	
	@RequestMapping(value = "/walkwrite")
	public String walkwrite() {
		
		return "walkwrite";
	}
	
	@RequestMapping(value = "/walkwritesave")
	public String walkwritesave(HttpServletRequest request) {
		String id=request.getParameter("id");
		String title = request.getParameter("walkwritetitle");
		String detail = request.getParameter("walkwritedetail");
		WalkService ws = sqlsession.getMapper(WalkService.class);
		ws.wsave(id,title,detail);
		return "redirect:/walkout";
	}
	
	@RequestMapping(value = "/walklist")
	public String wlist(Model model) {
		WalkService ws = sqlsession.getMapper(WalkService.class);
		ArrayList<WalkDTO> list = ws.walklist();
		model.addAttribute("list", list);
		return "walklist";
	}
	
}
