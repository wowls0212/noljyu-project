package com.mbc.nol.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbc.nol.how.HowPageDTO;
import com.mbc.nol.how.HowService;

@Controller
public class ReportController {
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "postreportsave")
	public String ppsave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int postnum = Integer.parseInt(request.getParameter("postnum"));
		String postid = request.getParameter("postid");
		String reason = request.getParameter("reportreason");
		String detail = request.getParameter("reportdetail");
		String reportid = request.getParameter("reportid");
		ReportService rs = sqlsession.getMapper(ReportService.class);
		rs.save(postnum,postid,reason,reportid,detail);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script type='text/javascript'>");
		out.print("self.close(); window.reload();");
		out.print("</script>");
		out.flush();
		
		return null;
	}
	
	@RequestMapping(value = "postreportout")
	public String postreportout(Model model, HttpServletRequest request, ReportPageDTO dto) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
        ReportService rs = sqlsession.getMapper(ReportService.class);
		
        //전체 레코드 수 구하기 
        int total=rs.reporttotal();
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
        dto = new ReportPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		model.addAttribute("list", rs.postreportout(dto));
		model.addAttribute("paging", dto);
		return "reportout";
	}
	
	
	@RequestMapping(value = "reviewreportsave")
	public String resave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int postnum = Integer.parseInt(request.getParameter("postnum"));
		int reviewnum = Integer.parseInt(request.getParameter("postreviewnum"));
		String id = request.getParameter("postid");
		String reason = request.getParameter("reportreason");
		String detail = request.getParameter("reportdetail");
		String reportid = request.getParameter("reportid"); 
		ReportService rs = sqlsession.getMapper(ReportService.class);
		rs.resave(postnum,reviewnum,id,reason,detail,reportid);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script type='text/javascript'>");
		out.print("self.close(); window.reload();");
		out.print("</script>");
		out.flush();
		return null;
	}
	
	@RequestMapping(value = "reviewreportout")
	public String rereport(Model model, HttpServletRequest request, ReportPageDTO dto) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
        ReportService rs = sqlsession.getMapper(ReportService.class);
		
        //전체 레코드 수 구하기 
        int total=rs.reviewreporttotal();
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
        dto = new ReportPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		model.addAttribute("list", rs.rereportout(dto));
		model.addAttribute("paging", dto);
		return "reviewreportout";
		
	}
	
	@RequestMapping(value = "proreviewreportsave")
	public String prosave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int productnum = Integer.parseInt(request.getParameter("productnum"));
		int proreviewnum = Integer.parseInt(request.getParameter("proreviewnum"));
		String id = request.getParameter("productid");
		String reason = request.getParameter("proreportreason");
		String detail = request.getParameter("proreportdetail");
		String reportid = request.getParameter("proreportid"); 
		ReportService rs = sqlsession.getMapper(ReportService.class);
		rs.proresave(productnum,proreviewnum,id,reason,detail,reportid);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script type='text/javascript'>");
		out.print("self.close(); window.reload();");
		out.print("</script>");
		out.flush();
		return null;
	}
	
	@RequestMapping(value = "productreportout")
	public String proreport(Model model, HttpServletRequest request, ReportPageDTO dto) {
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
        ReportService rs = sqlsession.getMapper(ReportService.class);
		
        //전체 레코드 수 구하기 
        int total=rs.proreporttotal();
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
        dto = new ReportPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		model.addAttribute("list", rs.prorereportout(dto));
		model.addAttribute("paging", dto);

		return "productreportout";
		
	}
	
	@RequestMapping(value = "reup")
	public String reup(HttpServletRequest request) {
		int postreportnum=Integer.parseInt(request.getParameter("postreportnum"));
		ReportService rs = sqlsession.getMapper(ReportService.class);
		rs.reup(postreportnum);
		return "reportout";
	}

	

}
