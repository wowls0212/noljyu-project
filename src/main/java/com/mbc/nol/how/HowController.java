package com.mbc.nol.how;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbc.nol.report.ReportService;

@Controller
public class HowController {

	@Autowired
	SqlSession sqlsession;
	String path="C:\\Noljyu\\Team-noljyu\\src\\main\\webapp\\image";
	
	//입력 페이지로 이동
	@RequestMapping(value = "/howinput")
	public String hh1() {
		return "howinput";
	}
	
	//게시글 DB 저장
	@RequestMapping(value = "/howsave")
	public String hh2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String id=mul.getParameter("id");
		String howtitle=mul.getParameter("howtitle");
		String howdetail=mul.getParameter("howdetail");
		String howtype=mul.getParameter("knowhow");
		MultipartFile mf = mul.getFile("howimg");
		String howimg=mf.getOriginalFilename();
		UUID uu = UUID.randomUUID();
		howimg=uu.toString()+"-"+howimg;
		System.out.println(id+" "+howtitle+" "+howdetail+ " "+howimg);
		HowService hs = sqlsession.getMapper(HowService.class);
		hs.howinsert(id,howtitle,howdetail,howimg,howtype);
		
		mf.transferTo(new File(path+"\\"+howimg));
		
		return "redirect:/main";
	}
	
	//게시글 출력
	@RequestMapping(value = "/howout")
	public String hh3(HttpServletRequest request, HowPageDTO dto, Model model) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
        HowService hs = sqlsession.getMapper(HowService.class);
		
        //전체 레코드 수 구하기 
        int total=hs.howtotal();
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
        dto = new HowPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		model.addAttribute("list", hs.howout(dto));
		model.addAttribute("paging", dto);
		return "howout";
	}
	
	//게시글 상세내용, 댓글/대댓글 출력
	@RequestMapping(value = "/howdetail")
	public String hh4(HttpServletRequest request , HowPageDTO pdto, Model model) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		int hownum = Integer.parseInt(request.getParameter("postnum"));
		HowService hs = sqlsession.getMapper(HowService.class);
		
		//전체 레코드 수 구하기
		int total=hs.howreviewtotal(hownum);
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
		pdto = new HowPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		HowDTO dto = hs.howdetailout(hownum);
		hs.howcnt(hownum);
		model.addAttribute("dto", dto);
		model.addAttribute("list", hs.howreviewout(hownum,pdto));
		model.addAttribute("paging", pdto);
		return "howdetail";
	}
	
	//댓글 저장
	@RequestMapping(value = "/howreviewsave")
	public String hh5(HttpServletRequest request, Model model) {
		int hownum=Integer.parseInt(request.getParameter("hownum"));
		String id = request.getParameter("id");
		String review=request.getParameter("review");
		String posttype=request.getParameter("posttype");
		HowService hs = sqlsession.getMapper(HowService.class);
		hs.howreview(hownum,id,review, posttype);
		//HowReviewDTO dot = hs.howreviewout();
		//model.addAttribute("dot", dot);
		return "redirect:/howdetail?postnum="+hownum;
	}
	
	//대댓글 입력 페이지
	@RequestMapping(value = "/howrere")
	public String hh6(HttpServletRequest request,Model model) {
		int reviewnum=Integer.parseInt(request.getParameter("reviewnum"));
		HowService hs = sqlsession.getMapper(HowService.class);
		HowReviewDTO dto = hs.howrere(reviewnum);
		model.addAttribute("dto", dto);
		return "howredetail";
	}
	
	//대댓글 DB 저장, 들여쓰기
	@ResponseBody
	@RequestMapping(value = "/howreresave")
	public String hh7(int reviewnum, String review, String id , HttpServletRequest request) {
		HowService hs = sqlsession.getMapper(HowService.class);
		//기존 댓글의 정보를 가져옴
		HowReviewDTO dto = hs.rereout(reviewnum);
		//기존 댓글의 hownum, id, groups, step, indent 가져옴
		int hownum=dto.getPostnum();
		//String id=dto.getId();
		int groups=dto.getPostgroups();
		int step=dto.getPoststep();
		int indent=dto.getPostindent();
		String posttype=dto.getPosttype();
		//step, indent 처리, 대댓글 DB 저장
		hs.howstepup(groups,step);
		step++;
		indent++;
		hs.howreinsert(hownum,id,review,groups,step,indent,posttype);
		
		//대댓글 확인
		int check = hs.rerecheck(review);
		System.out.println(check);
		String ch = Integer.toString(check);
		return ch;
	}
	
	//게시글 수정 페이지 이동
	@RequestMapping(value = "/howupdate")
	public String hh8(HttpServletRequest request, Model model) {
		int hownum=Integer.parseInt(request.getParameter("hownum"));
		HowService hs = sqlsession.getMapper(HowService.class);
		HowDTO dto = hs.howupdateout(hownum);
		model.addAttribute("dto", dto);
		return "howupdate";
	}
	
	//게시글 수정 사항 저장 
	@RequestMapping(value = "/howupdatesave")
	public String hh9(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int hownum=Integer.parseInt(mul.getParameter("hownum"));
		String howtitle=mul.getParameter("howtitle");
		String howdetail=mul.getParameter("howdetail");
		
		MultipartFile mf = mul.getFile("howimg");
		String howimg = mf.getOriginalFilename();
		UUID uu = UUID.randomUUID();
		howimg=uu.toString()+"-"+howimg;
		
		String howoldimg = mul.getParameter("howoldimg");
		HowService hs = sqlsession.getMapper(HowService.class);
		
		if (mf == null || mf.isEmpty()) {
			hs.howupdate(hownum,howtitle,howdetail);
		}
		else {
			hs.howupdateimg(hownum,howtitle,howdetail,howimg);
			mf.transferTo(new File(path+"\\"+howimg));
			File ff = new File(path+"\\"+howoldimg);
			ff.delete();
		}
		
		return "redirect:/howdetail?postnum="+hownum;
	}
	
	//게시글 삭제 ajax
	@ResponseBody
	@RequestMapping(value = "/howdelete")
	public String hh10(int hownum, HttpServletResponse response, HttpServletRequest request) {
		HowService hs = sqlsession.getMapper(HowService.class);
		hs.howdelete(hownum);
		int count = hs.howdeletecheck(hownum);
		String bigo="";
		if (count == 0 ) bigo = "success";
		else bigo = "fail";
		return bigo;
	}
	
	//게시글 검색
	@RequestMapping(value = "/howsearch")
	public String hh11(HttpServletRequest request,Model model) {
		String howkey = request.getParameter("howkey");
		String howvalue = request.getParameter("howvalue");
		HowService hs = sqlsession.getMapper(HowService.class);
		if (howkey.equals("all")) {
			ArrayList<HowDTO> alllist = hs.howsearchall(howvalue);
			model.addAttribute("list", alllist);
		}
		else {
			ArrayList<HowDTO> list = hs.howsearch(howkey,howvalue);
			model.addAttribute("list", list);
		}
		model.addAttribute("howvalue", howvalue);
		return "howsearch";
	}
	
	//댓글 수정 ajax
	@ResponseBody
	@RequestMapping(value = "/howreviewupdate")
	public String hh12(int reviewnum, String review, Model model) {
		System.out.println(reviewnum);
		HowService hs = sqlsession.getMapper(HowService.class);
		hs.howreviewupdate(reviewnum,review);
		int count = hs.howreviewcheck(review);
		String cnt = Integer.toString(count);
		return cnt;
	}
	
	//댓글 삭제 ajax
		@ResponseBody
		@RequestMapping(value = "/howreviewdelete")
		public String hh13(int reviewnum, HttpServletResponse response, HttpServletRequest request) {
			System.out.println(reviewnum);
			HowService hs = sqlsession.getMapper(HowService.class);
			hs.howreviewdelete(reviewnum);
			int count = hs.howreviewdeletecheck(reviewnum);
			String bigo="";
			if (count == 0 ) bigo = "success";
			else bigo = "fail";
			return bigo;
		}
		
		@RequestMapping(value = "postreport1")
		public String report(HttpServletRequest request, Model model) {
			int num = Integer.parseInt(request.getParameter("postnum"));
			String id = request.getParameter("id");
			HowService hs = sqlsession.getMapper(HowService.class);
			HowDTO dto = hs.postreport(num,id);
			model.addAttribute("dto", dto);
			return "postreport";
		}
		
		@RequestMapping(value = "postreportdel")
		public String reportsubmit(HttpServletRequest request) {
			int rpostnum = Integer.parseInt(request.getParameter("num"));
			System.out.println(rpostnum);
			HowService hs = sqlsession.getMapper(HowService.class);
			hs.reportsubmit(rpostnum);
			return "redirect:/main";
		}
		
		
		@RequestMapping(value = "reviewreport")
		public String reviewreport(HttpServletRequest request, Model model) {
			int num = Integer.parseInt(request.getParameter("reviewnum"));
			int postnum = Integer.parseInt(request.getParameter("postnum"));
			HowService hs = sqlsession.getMapper(HowService.class);
			HowReviewDTO dto = hs.reviewreport(num,postnum);
			model.addAttribute("dto", dto);
			return "reviewreport";
		}
		
		@RequestMapping(value = "reviewreportdel")
		public String reportdel(HttpServletRequest request) {
			int postnum = Integer.parseInt(request.getParameter("postnum"));
			int reviewnum = Integer.parseInt(request.getParameter("reviewnum"));
			HowService hs = sqlsession.getMapper(HowService.class);
			hs.reviewreportdel(postnum, reviewnum);
			return "redirect:/main";
		}
		
		@RequestMapping(value = "good1")
		public String good(HttpServletRequest request) {
			int postnum=Integer.parseInt(request.getParameter("goodnum"));
			HowService hs = sqlsession.getMapper(HowService.class);
			hs.good(postnum);
			return "redirect:/howdetail?postnum="+postnum;
		}
		
		@RequestMapping(value = "besthow")
		public String besthow(Model model, HttpServletRequest request) {
			HowService hs = sqlsession.getMapper(HowService.class);
			int postnum = Integer.parseInt(request.getParameter("postnum"));
			model.addAttribute("dto", hs.bestpost(postnum));
			return "howdetail";
		}
		
		
			
}
