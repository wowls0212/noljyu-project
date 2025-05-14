package com.mbc.nol.flea;

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

import com.mbc.nol.how.HowDTO;
import com.mbc.nol.how.HowPageDTO;
import com.mbc.nol.how.HowReviewDTO;
import com.mbc.nol.how.HowService;


@Controller
public class FleaController {

	@Autowired
	SqlSession sqlsession;
	String path="C:\\Noljyu\\Team-noljyu\\src\\main\\webapp\\image";
	
	@RequestMapping(value = "fleainput")
	public String hh1() {
		return "fleainput";
	}
	
	@RequestMapping(value = "/fleasave")
	public String hh2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String id=mul.getParameter("id");
		String fleatitle=mul.getParameter("fleatitle");
		String fleadetail=mul.getParameter("fleadetail");
		String fleatype=mul.getParameter("flea");
		MultipartFile mf = mul.getFile("fleaimg");
		String fleaimg=mf.getOriginalFilename();
		UUID uu = UUID.randomUUID();
		fleaimg=uu.toString()+"="+fleaimg;
		System.out.println(id+" "+fleatitle+" "+fleadetail+ " "+fleaimg);
		FleaService fs = sqlsession.getMapper(FleaService.class);
		fs.fleainsert(id,fleatitle,fleadetail,fleaimg,fleatype);
		mf.transferTo(new File(path+"\\"+fleaimg));
		
		return "redirect:/main";
	}
	
	@RequestMapping(value = "fleaout")
	public String hh3(Model model, FleaPageDTO dto, HttpServletRequest request) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		FleaService fs = sqlsession.getMapper(FleaService.class);
		
		//전체 레코드 수 구하기 
        int total=fs.fleatotal();
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
        dto = new FleaPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		model.addAttribute("list", fs.fleaout(dto));
		model.addAttribute("paging", dto);
		return "fleaout";
	}
	
	@RequestMapping(value = "fleadetail")
	public String hh4(HttpServletRequest request , FleaPageDTO pdto, Model model) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		int fleanum = Integer.parseInt(request.getParameter("postnum"));
		FleaService fs = sqlsession.getMapper(FleaService.class);
		
		//전체 레코드 수 구하기
		int total=fs.fleareviewtotal(fleanum);
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
		pdto = new FleaPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		FleaDTO dto = fs.fleadetailout(fleanum);
		fs.fleacnt(fleanum);
		model.addAttribute("dto", dto);
		model.addAttribute("list", fs.fleareviewout(fleanum,pdto));
		model.addAttribute("paging", pdto);
		return "fleadetail";
	}
	
	@RequestMapping(value = "fleareviewsave")
	public String hh5(HttpServletRequest request, Model model) {
		int fleanum=Integer.parseInt(request.getParameter("fleanum"));
		String id = request.getParameter("id");
		String review=request.getParameter("review");
		String posttype = request.getParameter("posttype");
		FleaService fs = sqlsession.getMapper(FleaService.class);
		fs.fleareview(fleanum,id,review,posttype);
		//fleaReviewDTO dot = hs.fleareviewout();
		//model.addAttribute("dot", dot);
		return "redirect:/fleadetail?postnum="+fleanum;
	}
	
	@RequestMapping(value = "flearere")
	public String hh6(HttpServletRequest request,Model model) {
		int reviewnum=Integer.parseInt(request.getParameter("reviewnum"));
		FleaService fs = sqlsession.getMapper(FleaService.class);
		FleaReviewDTO dto = fs.flearere(reviewnum);
		model.addAttribute("dto", dto);
		return "flearedetail";
	}
	
	//대댓글 DB 저장, 들여쓰기
	@ResponseBody
	@RequestMapping(value = "/reresave")
	public String hh7(int reviewnum, String review,String id , HttpServletRequest request) {
		FleaService fs = sqlsession.getMapper(FleaService.class);
		//기존 댓글의 정보를 가져옴
		FleaReviewDTO dto = fs.rereout(reviewnum);
		
		//기존 댓글의 hownum, id, groups, step, indent 가져옴
		int fleanum=dto.getPostnum();
		//String id=dto.getId(); //추후에 사용자 아이디 ${id}로 바꿔야 함
		int groups=dto.getPostgroups();
		int step=dto.getPoststep();
		int indent=dto.getPostindent();
		String posttype=dto.getPosttype();
		//step, indent 처리, 대댓글 DB 저장
		fs.fleastepup(groups,step);
		step++;
		indent++;
		fs.fleareinsert(fleanum,id,review,groups,step,indent,posttype);
		
		//대댓글 확인
		int check = fs.rerecheck(review);
		System.out.println(check);
		return Integer.toString(check);
	}
	
	@RequestMapping(value = "/fleaupdate")
	public String fleaupdate(HttpServletRequest request, Model model) {
		int fleanum = Integer.parseInt(request.getParameter("fleanum"));
		FleaService fs = sqlsession.getMapper(FleaService.class);
		FleaDTO dto = fs.fleaupdateout(fleanum);
		model.addAttribute("dto", dto);
		return "fleaupdate";
	}
	
	@RequestMapping(value = "/fleaupdatesave")
	public String fleaupdatesave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int fleanum=Integer.parseInt(mul.getParameter("fleanum"));
		String fleatitle=mul.getParameter("fleatitle");
		String fleadetail=mul.getParameter("fleadetail");
		
		MultipartFile mf = mul.getFile("fleaimg");
		String fleaimg = mf.getOriginalFilename();
		UUID uu = UUID.randomUUID();
		fleaimg=uu.toString()+"-"+fleaimg;
		
		String fleaoldimg = mul.getParameter("fleaoldimg");
		FleaService fs = sqlsession.getMapper(FleaService.class);
		
		if (mf == null || mf.isEmpty()) {
			fs.fleaupdate(fleanum,fleatitle,fleadetail);
		}
		else {
			fs.fleaupdateimg(fleanum,fleatitle,fleadetail,fleaimg);
			mf.transferTo(new File(path+"\\"+fleaimg));
			File ff = new File(path+"\\"+fleaoldimg);
			ff.delete();
		}
		
		return "redirect:/fleadetail?postnum="+fleanum;
	}
	
	@ResponseBody
	@RequestMapping(value = "/postdelete")
	public String fleadelete(int postnum, HttpServletResponse response, HttpServletRequest request) {
		FleaService fs = sqlsession.getMapper(FleaService.class);
		fs.fleadelete(postnum);
		int count = fs.fleadeletecheck(postnum);
		String bigo="";
		if (count == 0 ) bigo = "success";
		else bigo = "fail";
		return bigo;
	}
	
	//게시글 검색
	@RequestMapping(value = "/fleasearch")
	public String fleasearch(HttpServletRequest request,Model model) {
		String fleakey = request.getParameter("fleakey");
		String fleavalue = request.getParameter("fleavalue");
		FleaService fs = sqlsession.getMapper(FleaService.class);
		if (fleakey.equals("all")) {
			ArrayList<FleaDTO> alllist = fs.fleasearchall(fleavalue);
			model.addAttribute("list", alllist);
		}
		else {
			ArrayList<FleaDTO> list = fs.fleasearch(fleakey,fleavalue);
			model.addAttribute("list", list);
		}
		model.addAttribute("fleavalue", fleavalue);
		return "fleasearch";
	}
	
	//댓글 수정 ajax
	@ResponseBody
	@RequestMapping(value = "/reviewupdate")
	public String hh12(int reviewnum, String review, Model model) {
		//System.out.println(reviewnum);
		FleaService fs = sqlsession.getMapper(FleaService.class);
		fs.fleareviewupdate(reviewnum,review);
		int count = fs.fleareviewcheck(review);
		String cnt = Integer.toString(count);
		return cnt;
	}
	
	//댓글 삭제 ajax
	@ResponseBody
	@RequestMapping(value = "/reviewdelete")
		public String hh13(int reviewnum, HttpServletResponse response, HttpServletRequest request) {
		//System.out.println(reviewnum);
		FleaService fs = sqlsession.getMapper(FleaService.class);
		fs.fleareviewdelete(reviewnum);
		int count = fs.fleareviewdeletecheck(reviewnum);
		String bigo="";
		if (count == 0 ) bigo = "success";
		else bigo = "fail";
		return bigo;
			}
	
	@RequestMapping(value = "good2")
	public String good(HttpServletRequest request) {
		int postnum=Integer.parseInt(request.getParameter("goodnum"));
		System.out.println(postnum);
		FleaService fs = sqlsession.getMapper(FleaService.class);
		fs.good(postnum);
		return "redirect:/fleadetail?postnum="+postnum;
	}
	
}
