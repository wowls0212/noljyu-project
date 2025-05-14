package com.mbc.nol.product;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbc.nol.how.HowDTO;
import com.mbc.nol.how.HowPageDTO;
import com.mbc.nol.how.HowReviewDTO;
import com.mbc.nol.how.HowService;

@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	String path="C:\\Noljyu\\Team-noljyu\\src\\main\\webapp\\image";
	
	@RequestMapping(value = "/productinput")
	public String product1()
	{	
		
		return "productinput";
	}
	
	@RequestMapping(value = "/productsave")
	public String product2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{
			String id=mul.getParameter("id");
			String animal=mul.getParameter("animal");
			String productlist=mul.getParameter("productlist");				
			int price=Integer.parseInt(mul.getParameter("price"));
			MultipartFile mf=mul.getFile("productimg");
			String fname=mf.getOriginalFilename();
			UUID uu=UUID.randomUUID();
			fname=uu.toString()+"_"+fname;
			mf.transferTo(new File(path+"\\"+fname));				
			String productname=mul.getParameter("productname");
			String productlink=mul.getParameter("productlink");
			ProductService ps=sqlSession.getMapper(ProductService.class);
			ps.productinput(id,animal,productlist,price,fname,productname,productlink);			
			
			return "redirect:/main";
	}
	
	@RequestMapping(value = "/productout")
	public String product3(Model model, ProductPageDTO dto, HttpServletRequest request) 
	{	
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.prototal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		model.addAttribute("list", ps.productout(dto));
		model.addAttribute("paging", dto);
		return "productout";
	}
	
	@RequestMapping(value = "/productdetail")
	public String product4(HttpServletRequest request,Model model, ProductPageDTO pdto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		int num=Integer.parseInt(request.getParameter("num"));
		ProductService ps=sqlSession.getMapper(ProductService.class);
		ps.productcnt(num);
		int total=ps.proreviewtotal(num);
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
		pdto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		ProductDTO dto = ps.productdetail(num);
		model.addAttribute("dto", dto);
		model.addAttribute("list", ps.proreviewout(num,pdto));
		model.addAttribute("paging", pdto);	
		return "productdetail";
	}
	
	@RequestMapping(value = "/proreviewsave")
	public String proreviewsave(HttpServletRequest request, Model model) {
		int productnum = Integer.parseInt(request.getParameter("productnum"));
		String id = request.getParameter("id");
		String proreview = request.getParameter("review");
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ps.proreview(productnum, id, proreview);
		return "redirect:/productdetail?num="+productnum;
	}

	
	@ResponseBody
	@RequestMapping(value = "/proreresave")
	public String proreresave(int reviewnum, String review, HttpServletRequest request) {
		ProductService ps = sqlSession.getMapper(ProductService.class);
		
		ProreviewDTO dto = ps.prorereout(reviewnum);
		int productnum=dto.getProductnum();
		String id=dto.getId();
		int groups = dto.getProgroups();
		int step = dto.getProstep();
		int indent = dto.getProindent();
		System.out.println(productnum);
		ps.prostepup(groups,step);
		step++;
		indent++;
		ps.proreinsert(productnum,id,review,groups,step,indent);
		
		int check = ps.prorerecheck(review);
		System.out.println(check);
		return Integer.toString(check);
	}
	
	@ResponseBody
	@RequestMapping(value = "/proreviewupdate")
	public String proreviewupdate(int reviewnum, String review, Model model) {
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ps.proreviewupdate(reviewnum,review);
		int count = ps.proreviewcheck(review);
		
		String cnt = Integer.toString(count);
		System.out.println(cnt);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value = "/proreviewdelete")
	public String reviewdel(int reviewnum, HttpServletResponse response, HttpServletRequest request) {
		ProductService ps = sqlSession.getMapper(ProductService.class);
		ps.proreviewdelete(reviewnum);
		int count = ps.proreviewdeletecheck(reviewnum);
		String bigo = "";
		if (count == 0) bigo ="success";
		else bigo="fail";
		return bigo;
	}
	
		
	@RequestMapping(value = "/pmodify1")
	public String product5(HttpServletRequest request, Model model) 
	{
		int unum=Integer.parseInt(request.getParameter("num"));
		String fname=request.getParameter("fname");
		ProductService ps=sqlSession.getMapper(ProductService.class);
		ProductDTO dto=ps.pmodify1(unum);
		model.addAttribute("dto",dto);
		
		return "pmodify1";
	}
	
	@RequestMapping(value = "/pmodifysave")
	public String product6(MultipartHttpServletRequest mul) throws IllegalStateException, IOException 
	{
		int productnum=Integer.parseInt(mul.getParameter("productnum"));
		String id=mul.getParameter("id");
		String animal=mul.getParameter("animal");
		String productlist=mul.getParameter("productlist");		
		int price=Integer.parseInt(mul.getParameter("price"));
		MultipartFile mf=mul.getFile("productimg");
		String fname;
		String dfname = null;
		if(mf==null) {
			fname=mul.getParameter("himage");
		}
		else {
			dfname=mul.getParameter("himage");
			fname=mf.getOriginalFilename();
			UUID uu=UUID.randomUUID();
			fname=uu.toString()+"_"+fname;
		}
		String productname=mul.getParameter("productname");
		String productlink=mul.getParameter("productlink");
		ProductService ps=sqlSession.getMapper(ProductService.class);
		ps.pmodify2(productnum,id,animal,productlist,price,fname,productname,productlink);
		mf.transferTo(new File(path+"\\"+fname));
		mf.transferTo(new File(path+"\\"+dfname));
		File ff=new File(path+"\\"+dfname);
		ff.delete();
				
		return "redirect:/productout";
	}
	
	
	@RequestMapping(value = "/pdelete2")
	public String product8(HttpServletRequest request) 
	{
		int dnum=Integer.parseInt(request.getParameter("num"));
		String dfname=request.getParameter("himage");		
		ProductService ps=sqlSession.getMapper(ProductService.class);
		ps.pdelete2(dnum);		
		File ff=new File(path+"\\"+dfname);
		ff.delete();	
		
		return "redirect:/producttotal";
	}
	
	
	@RequestMapping(value = "/productsearch")
	public String product9() 
	{
		return "psearch1";
	}
	
	@RequestMapping(value = "/psearch2")
	public String product10(HttpServletRequest request, Model model) 
	{
		String name=request.getParameter("scname");
		String val=request.getParameter("scval");
		String value=request.getParameter("scvalue");
		ProductService ps=sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list=ps.psearch2(name,val,value);
		model.addAttribute("list", list);
				
		return "psearch2";
	}
	
	@RequestMapping(value = "/dogproductmain")
	public String product11(HttpServletRequest request,Model model,ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.dogmaintotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.dogproductout(dto));
		model.addAttribute("paging", dto);
		
		return "dogproductmain";
	}
	
	@RequestMapping(value = "dogfoodsnack")
	public String product12(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.dogfoodtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.dogfoodsnack(dto));
		model.addAttribute("paging", dto);
		
		return "dogfoodsnack";
	}
	
	@RequestMapping(value = "dogtoyliving")
	public String product13(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.doglivingtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.dogtoyliving(dto));
		model.addAttribute("paging", dto);
		
		return "dogtoyliving";
	}
	
	@RequestMapping(value = "doghealthtoilet")
	public String product14(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.doghealthtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.doghealthtoilet(dto));
		model.addAttribute("paging", dto);	
		
		return "doghealthtoilet";
	}
	
	@RequestMapping(value = "dogbeautyfashion")
	public String product15(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.dogbeautytotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.dogbeautyfashion(dto));
		model.addAttribute("paging", dto);
		
		return "dogbeautyfashion";
	}
	
	@RequestMapping(value = "/catproductmain")
	public String product16(HttpServletRequest request,Model model,ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.catmaintotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.catproductout(dto));
		model.addAttribute("paging", dto);
		
		return "catproductmain";
	}
	
	@RequestMapping(value = "catfoodsnack")
	public String product17(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.catfoodtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.catfoodsnack(dto));
		model.addAttribute("paging", dto);
		
		return "catfoodsnack";
	}
	
	@RequestMapping(value = "cattoyliving")
	public String product18(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.catlivingtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.cattoyliving(dto));
		model.addAttribute("paging", dto);	
		
		return "cattoyliving";
	}
	
	@RequestMapping(value = "cathealthtoilet")
	public String product19(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.cathealthtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.cathealthtoilet(dto));
		model.addAttribute("paging", dto);	
		
		return "cathealthtoilet";
	}
	
	@RequestMapping(value = "catbeautyfashion")
	public String product20(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.catbeautytotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.catbeautyfashion(dto));
		model.addAttribute("paging", dto);
		
		return "catbeautyfashion";
	}	
	
	@RequestMapping(value = "/birdproductmain")
	public String product21(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{	
			String nowPage=request.getParameter("nowPage");
	        String cntPerPage=request.getParameter("cntPerPage");
			ProductService ps=sqlSession.getMapper(ProductService.class);
	        //전체 레코드 수 구하기 
	        int total=ps.birdmaintotal();
	        if(nowPage==null && cntPerPage == null) {
	           nowPage="1";
	           cntPerPage="12";
	        }
	        else if(nowPage==null) {
	           nowPage="1";
	        }
	        else if(cntPerPage==null) {
	           cntPerPage="12";
	        }
	        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
	        model.addAttribute("list", ps.birdproductout(dto));
			model.addAttribute("paging", dto);
		return "birdproductmain";
	}	
	
	@RequestMapping(value = "birdfoodsnack")
	public String product22(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.birdfoodtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.birdfoodsnack(dto));
		model.addAttribute("paging", dto);
		return "birdfoodsnack";
	}
	
	@RequestMapping(value = "birdtoyliving")
	public String product23(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.birdlivingtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.birdtoyliving(dto));
		model.addAttribute("paging", dto);		
		return "birdtoyliving";
	}
	
	@RequestMapping(value = "birdhealthtoilet")
	public String product24(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.birdhealthtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.birdhealthtoilet(dto));
		model.addAttribute("paging", dto);	
		
		return "birdhealthtoilet";
	}
	
	@RequestMapping(value = "birdbeautyfashion")
	public String product25(HttpServletRequest request,Model model,ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.birdbeautytotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.birdbeautyfashion(dto));
		model.addAttribute("paging", dto);	
		
		return "birdbeautyfashion";
	}	
	
	@RequestMapping(value = "/fishproductmain")
	public String product26(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.fishmaintotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.fishproductout(dto));
		model.addAttribute("paging", dto);
		
		return "fishproductmain";
	}
	
	@RequestMapping(value = "fishfoodsnack")
	public String product27(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.fishfoodtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.fishfoodsnack(dto));
		model.addAttribute("paging", dto);
		
		return "fishfoodsnack";
	}
	
	@RequestMapping(value = "fishtoyliving")
	public String product28(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.fishlivingtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.fishtoyliving(dto));
		model.addAttribute("paging", dto);	
		
		return "fishtoyliving";
	}
	
	@RequestMapping(value = "fishhealthtoilet")
	public String product29(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.fishhealthtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.fishhealthtoilet(dto));
		model.addAttribute("paging", dto);
		
		return "fishhealthtoilet";
	}
	
	@RequestMapping(value = "fishbeautyfashion")
	public String product30(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.fishbeautytotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.fishbeautyfashion(dto));
		model.addAttribute("paging", dto);
		
		return "fishbeautyfashion";
	}	
	
	@RequestMapping(value = "/creepproductmain")
	public String product31(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.creepmaintotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.creepproductout(dto));
		model.addAttribute("paging", dto);
		
		return "creepproductmain";
	}
	
	@RequestMapping(value = "creepfoodsnack")
	public String product32(HttpServletRequest request,Model model,ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.creepfoodtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.creepfoodsnack(dto));
		model.addAttribute("paging", dto);
		
		return "creepfoodsnack";
	}
	
	@RequestMapping(value = "creeptoyliving")
	public String product33(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.creeplivingtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.creeptoyliving(dto));
		model.addAttribute("paging", dto);
		
		return "creeptoyliving";
	}
	
	@RequestMapping(value = "creephealthtoilet")
	public String product34(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.creephealthtotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.creephealthtoilet(dto));
		model.addAttribute("paging", dto);
		
		return "creephealthtoilet";
	}
	
	@RequestMapping(value = "creepbeautyfashion")
	public String product35(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.creepbeautytotal();
        if(nowPage==null && cntPerPage == null) {
           nowPage="1";
           cntPerPage="12";
        }
        else if(nowPage==null) {
           nowPage="1";
        }
        else if(cntPerPage==null) {
           cntPerPage="12";
        }
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", ps.creepbeautyfashion(dto));
		model.addAttribute("paging", dto);
		
		return "creepbeautyfashion";
	}	
			
	@RequestMapping(value = "/productbuy")
	public String product36(Model model,HttpServletRequest request) 
	{
		int num=Integer.parseInt(request.getParameter("num"));
		ProductService ps=sqlSession.getMapper(ProductService.class);
		ArrayList<ProductDTO>list=ps.productbuy(num);
		model.addAttribute("list",list);
				
		return "productbuy";
	}	
		

	@RequestMapping(value = "proreviewreport")
	public String report(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("proreviewnum"));
		String id = request.getParameter("id");
		ProductService ps=sqlSession.getMapper(ProductService.class);
		ProreviewDTO dto = ps.proreport(num,id);
		model.addAttribute("dto", dto);
		return "proreviewreport";
	}
	
	@RequestMapping(value = "proreviewreportdel")
	public String redel(HttpServletRequest request) {
		int proreviewnum = Integer.parseInt(request.getParameter("proreviewnum"));
		ProductService ps=sqlSession.getMapper(ProductService.class);
		ps.redel(proreviewnum);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/producttotal")
	public String product37(HttpServletRequest request,Model model, ProductPageDTO dto) 
	{
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		ProductService ps=sqlSession.getMapper(ProductService.class);
        //전체 레코드 수 구하기 
        int total=ps.listtotal();
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
        dto = new ProductPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
		ArrayList<ProductDTO>list=ps.producttotal(dto);
		model.addAttribute("list",list);
		model.addAttribute("paging", dto);
		
		return "producttotal";
	}
	
	
}
