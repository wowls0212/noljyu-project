package com.mbc.nol.community;

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

import com.mbc.nol.how.HowPageDTO;
import com.mbc.nol.how.HowReviewDTO;
import com.mbc.nol.how.HowService;



@Controller
public class ComController {

	@Autowired
	SqlSession sqlsession;
	String path="C:\\Noljyu\\Team-noljyu\\src\\main\\webapp\\image";
	@RequestMapping(value = "/cominput")
	public String cominput() {
		String path = "";
		return "cominput";
	}
	
	@RequestMapping(value = "/comsave")
	public String comsave(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		String id = request.getParameter("id");
		String comtitle  = request.getParameter("comtitle");
		String comdetail = request.getParameter("comdetail");
		String comtype = request.getParameter("community");
		MultipartFile mf = request.getFile("comimg");
		String comimg = mf.getOriginalFilename();
		UUID uu = UUID.randomUUID();
		comimg = uu+"-"+comimg;
		mf.transferTo(new File(path+"\\"+comimg));
		ComService cs = sqlsession.getMapper(ComService.class);
		cs.comsave(id, comtitle, comdetail, comimg,comtype);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/comout")
	public String comout(Model model, HttpServletRequest request, ComPageDTO dto) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ComService cs = sqlsession.getMapper(ComService.class);
		int total=cs.comtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="10";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="10";
        }
        dto = new ComPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		model.addAttribute("list", cs.comout(dto));
		model.addAttribute("paging", dto);
		return "comout";
	}
	
	@RequestMapping(value = "/comdetail")
	public String comdetail(HttpServletRequest request , ComPageDTO pdto, Model model) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		int comnum = Integer.parseInt(request.getParameter("postnum"));
		ComService cs = sqlsession.getMapper(ComService.class);
		//전체 레코드 수 구하기
		int total=cs.comreviewtotal(comnum);
		System.out.println(total);
		if(nowPage==null && cntPerPage == null) {
		   nowPage="1";
		   cntPerPage="5";
		}
		else if(nowPage==null) {
		   nowPage="1";
		}
		else if(cntPerPage==null) {
		   cntPerPage="5";
		}
		pdto = new ComPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		ComDTO dto = cs.comdetail(comnum);
		cs.comcnt(comnum);
		model.addAttribute("dto", dto);
		model.addAttribute("list", cs.comreviewout(comnum,pdto));
		model.addAttribute("paging", pdto);
		
		return "comdetail";
	}
	
	@RequestMapping(value = "/comreviewsave")
	public String comreviewsave(HttpServletRequest request) {
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		String id = request.getParameter("id");
		String review = request.getParameter("review");
		String posttype=request.getParameter("posttype");
		ComService cs = sqlsession.getMapper(ComService.class);
		cs.comreview(comnum, id, review, posttype);
		return "redirect:/comdetail?postnum="+comnum;
	}
	
	@RequestMapping(value = "comrere")
	public String comrere(HttpServletRequest request, Model model) {
		int comreviewnum = Integer.parseInt(request.getParameter("reviewnum"));
		ComService cs = sqlsession.getMapper(ComService.class);
		ComReviewDTO dto = cs.comrere(comreviewnum);
		model.addAttribute("dto", dto);
		return "comredetail";
	}

	
	//대댓글 DB 저장, 들여쓰기
	@ResponseBody
	@RequestMapping(value = "/comreresave")
	public String hh7(int reviewnum, String review, String id, HttpServletRequest request) {
		ComService cs = sqlsession.getMapper(ComService.class);
		//기존 댓글의 정보를 가져옴
		ComReviewDTO dto = cs.comrereout(reviewnum);
		
		//기존 댓글의 hownum, id, groups, step, indent 가져옴
		int comnum=dto.getPostnum();
		//String id=dto.getId(); //추후에 사용자 아이디 ${id}로 바꿔야 함
		int groups=dto.getPostgroups();
		int step=dto.getPoststep();
		int indent=dto.getPostindent();
		String posttype=dto.getPosttype();
		//step, indent 처리, 대댓글 DB 저장
		cs.comstepup(groups,step);
		step++;
		indent++;
		cs.comreinsert(comnum,id,review,groups,step,indent,posttype);
		
		//대댓글 확인
		int check = cs.comrerecheck(review);
		System.out.println(check);
		return Integer.toString(check);
	}
	
	@RequestMapping(value = "/comupdate")
	public String comupdate(HttpServletRequest request, Model model) {
		int comnum=Integer.parseInt(request.getParameter("comnum"));
		ComService cs = sqlsession.getMapper(ComService.class);
		ComDTO dto = cs.comupdateout(comnum);
		model.addAttribute("dto", dto);
		return "comupdate";
	}
	
	@RequestMapping(value = "/comupdatesave")
	public String comupdatesave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int comnum=Integer.parseInt(mul.getParameter("comnum"));
		String comtitle=mul.getParameter("comtitle");
		String comdetail=mul.getParameter("comdetail");
		
		MultipartFile mf = mul.getFile("comimg");
		String comimg = mf.getOriginalFilename();
		UUID uu = UUID.randomUUID();
		comimg=uu.toString()+"-"+comimg;
		
		String comoldimg = mul.getParameter("comoldimg");
		ComService cs = sqlsession.getMapper(ComService.class);
		
		if (mf == null || mf.isEmpty()) {
			cs.comupdate(comnum,comtitle,comdetail);
		}
		else {
			cs.comupdateimg(comnum,comtitle,comdetail,comimg);
			mf.transferTo(new File(path+"\\"+comimg));
			File ff = new File(path+"\\"+comoldimg);
			ff.delete();
		}
		
		return "redirect:/comdetail?postnum="+comnum;
	}
	
	@ResponseBody
	@RequestMapping(value = "/comdelete")
	public String comdelete(int comnum, HttpServletResponse response, HttpServletRequest request) {
		ComService cs = sqlsession.getMapper(ComService.class);
		cs.comdelete(comnum);
		int count = cs.comdeletecheck(comnum);
		String bigo="";
		if (count == 0 ) bigo = "success";
		else bigo = "fail";
		return bigo;
	}
	
	//게시글 검색
	@RequestMapping(value = "/comsearch")
	public String comsearch(HttpServletRequest request,Model model) {
		String comkey = request.getParameter("comkey");
		String comvalue = request.getParameter("comvalue");
		ComService cs = sqlsession.getMapper(ComService.class);
		if (comkey.equals("all")) {
			ArrayList<ComDTO> alllist = cs.comsearchall(comvalue);
			model.addAttribute("list", alllist);
		}
		else {
			ArrayList<ComDTO> list = cs.comsearch(comkey,comvalue);
			model.addAttribute("list", list);
		}
		model.addAttribute("comvalue", comvalue);
		return "comsearch";
	}
	
	//댓글 수정 ajax
		@ResponseBody
		@RequestMapping(value = "/comreviewupdate")
		public String hh12(int reviewnum, String review, Model model) {
			System.out.println(reviewnum);
			ComService cs = sqlsession.getMapper(ComService.class);
			cs.comreviewupdate(reviewnum,review);
			int count = cs.comreviewcheck(review);
			String cnt = Integer.toString(count);
			return cnt;
		}
		
		//댓글 삭제 ajax
			@ResponseBody
			@RequestMapping(value = "/comreviewdelete")
			public String hh13(int reviewnum, HttpServletResponse response, HttpServletRequest request) {
				System.out.println(reviewnum);
				ComService cs = sqlsession.getMapper(ComService.class);
				cs.comreviewdelete(reviewnum);
				int count = cs.comreviewdeletecheck(reviewnum);
				String bigo="";
				if (count == 0 ) bigo = "success";
				else bigo = "fail";
				return bigo;
			}
			
			@RequestMapping(value = "good3")
			public String good(HttpServletRequest request) {
				int postnum=Integer.parseInt(request.getParameter("goodnum"));
				ComService cs = sqlsession.getMapper(ComService.class);
				cs.good(postnum);
				return "redirect:/comdetail?postnum="+postnum;
			}
	
}//controller
