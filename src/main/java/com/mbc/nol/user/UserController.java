package com.mbc.nol.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mbc.nol.how.HowDTO;
import com.mbc.nol.how.HowPageDTO;
import com.mbc.nol.how.HowService;


@Controller
public class UserController {
	@Autowired
	SqlSession sqlSession;
	String path = "C:\\Noljyu\\Team-noljyu\\src\\main\\webapp\\image";
	// 회원가입 폼 이동
	@RequestMapping(value = "/userinput")
	public String userInputPage() {
		return "userinput";
	}

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/idcheck2")
	public String idCheck(String id) {
		UserService us = sqlSession.getMapper(UserService.class);
		int count = us.idcount(id);
		String bigo = "";
		if (count == 1) {
			bigo = "no";
		} else {
			bigo = "ok";
		}
		return bigo;
	}
	
	// 닉네임 중복 검사
	@ResponseBody
	@RequestMapping(value = "/nicknamecheck", method = RequestMethod.POST)
	public String nicknameCheck(String nickname) {
	    UserService us = sqlSession.getMapper(UserService.class);
	    int count = us.nicknamecount(nickname);
	    String bigo = "";
		if (count == 1) {
			bigo = "no";
		} else {
			bigo = "ok";
		}
		return bigo;
	}

	// 회원가입 처리
	@RequestMapping(value = "/usersave", method = RequestMethod.POST)
	public String userSave(MultipartHttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String nickname = request.getParameter("nickname");
		String myanimal = request.getParameter("myanimal");
		String admin = request.getParameter("admin");
		String petName = request.getParameter("petName");

		MultipartFile mf = request.getFile("uploadfile");
		UUID uu = UUID.randomUUID();
		String photoName;
		if (mf != null && !mf.isEmpty()) {
			String oriName = mf.getOriginalFilename();
			photoName = uu.toString() +"-" +oriName;
			mf.transferTo(new File(path + "\\" + photoName));
			
		}
		else {
			photoName = "default.jpg";
			
		}
		
		PasswordEncoder pe = new BCryptPasswordEncoder();
		String encodedPw = pe.encode(pw);
		UserService us = sqlSession.getMapper(UserService.class);

		if (us.nicknamecount(nickname) > 0) {
			model.addAttribute("msg", "이미 사용 중인 닉네임입니다.");
			return "userinput";
		}

		if ("admin".equals(admin)) {
			String inputAdminPass = request.getParameter("adminPass");
			String savedAdminPass = us.getAdminPassword();

			if (savedAdminPass == null || !savedAdminPass.startsWith("$2") || !pe.matches(inputAdminPass, savedAdminPass)) {
				model.addAttribute("msg", "관리자용 비밀번호가 일치하지 않습니다.");
				return "userinput";
			}
		}

		us.insertq(id, encodedPw, name, address, phone, nickname, myanimal, admin, petName, photoName);
		session.setAttribute("msg", "환영합니다! 회원가입이 완료되었습니다.");
		return "redirect:/main";
	}
	
	// 회원 목록 출력
	@RequestMapping(value = "/userout")
	public String userOut(HttpServletRequest request,Model model , UserPageDTO dto) throws IOException {
		HttpSession hs = request.getSession();
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
        UserService us = sqlSession.getMapper(UserService.class);
        int total=us.usertotal();
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
        dto = new UserPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        model.addAttribute("list", us.allout(dto));
        model.addAttribute("paging", dto);
        return "userout";
	}
	
	// 회원 정보 삭제
	@RequestMapping(value = "/admindelete", method = RequestMethod.POST)
	public String adminDelete(HttpServletRequest request, HttpSession session) {
	    String id = request.getParameter("id");

	    UserService us = sqlSession.getMapper(UserService.class);
	    us.delete2(id); // 삭제 수행

	    session.setAttribute("msg", "회원 삭제가 완료되었습니다.");
	    return "redirect:/userout";
	}
	// 검색 페이지 이동
	@RequestMapping(value = "/usersearch")
	public String userSearchPage() {
		return "scearch";
	}

	// 검색 처리
	@RequestMapping(value = "/scearch2")
	public String userSearchResult(HttpServletRequest request, Model model,UserPageDTO dto) {
		String cate = request.getParameter("cate");
		String keyword = request.getParameter("scearch");
		String nowPage=request.getParameter("nowPage");
        String cntPerPage=request.getParameter("cntPerPage");
		UserService us = sqlSession.getMapper(UserService.class);
		int total=us.usersearchtotal();
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
        dto = new UserPageDTO(Integer.parseInt(nowPage), total, Integer.parseInt(cntPerPage));
        ArrayList<UserDTO> list = us.searcha(cate, keyword);
		model.addAttribute("list", list);
		model.addAttribute("paging", dto);
		return "scearchout";
	}

	// 마이페이지
	@RequestMapping(value = "/mypage")
	public String myPage(Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("id");
		if (loginId == null) return "redirect:/login";
		
		//  내 정보 조회
		UserService us= sqlSession.getMapper(UserService.class);
		UserDTO myinfo= us.getuser(loginId);
		
		// 내가 쓴 글 조회
		HowService hs= sqlSession.getMapper(HowService.class);
		ArrayList<HowDTO> mypost = hs.mypost(loginId);
		
		model.addAttribute("goodtotal", hs.goodtotal(loginId));
		model.addAttribute("myinfo", myinfo);
		model.addAttribute("myPosts", mypost);
		return "mypageout";
	}
	


	// 회원정보 수정 폼
	@RequestMapping(value = "/modify1")
	public String modifyForm(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		UserService us = sqlSession.getMapper(UserService.class);
		UserDTO dto = us.modify1(id);
		model.addAttribute("dto", dto);
		return "modify1";
	}

	// 회원정보 수정 저장
	@RequestMapping(value = "/modifysave", method = RequestMethod.POST)
	public String modifySave(MultipartHttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
	    String id = request.getParameter("id");
	    String pwInput = request.getParameter("pw");
	    String name = request.getParameter("name");
	    String address = request.getParameter("address");
	    String phone = request.getParameter("phone");
	    String nickname = request.getParameter("nickname");
	    String myanimal = request.getParameter("myanimal");
	    String petName = request.getParameter("petName");

	    UserService us = sqlSession.getMapper(UserService.class);
	    UserDTO dto = us.getuser(id);
	    
	  // 비밀번호 변경 여부 확인
	    String pw = dto.getPw();
	    if (pwInput != null && !pwInput.trim().isEmpty()) {
	        pw = new BCryptPasswordEncoder().encode(pwInput);
	    }

	    MultipartFile mf = request.getFile("uploadfile");
	    String photo;
	    UUID uu = UUID.randomUUID();
	    if (mf != null && !mf.isEmpty()) {
	    	String upimg = mf.getOriginalFilename();
	    	photo = uu.toString()+"-"+upimg;
		    mf.transferTo(new File(path+"\\"+photo));
			
		}
		else {
			photo = "default.jpg";
			
		}
	    
	    		
	    if (petName == null || petName.trim().isEmpty()) {
	        petName = dto.getPetName();
	    }

	    us.modifyWithPhoto(id, pw, name, address, phone, nickname, myanimal, petName, photo); 

	    session.setAttribute("msg", "회원정보가 수정되었습니다.");
	    return "redirect:/main";
	}

	// 회원 탈퇴 확인
	@RequestMapping(value = "/delete1")
	public String deletePage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		if (id == null)
			return "redirect:/login";

		UserService us = sqlSession.getMapper(UserService.class);
		UserDTO dto = us.delete1(id);
		model.addAttribute("dto", dto);
		return "deleteview";
	}

	// 회원 탈퇴 처리
	@RequestMapping(value = "/delete2", method = RequestMethod.POST)
	public String deleteConfirm(HttpServletRequest request, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) return "redirect:/login";

		UserService us = sqlSession.getMapper(UserService.class);
		UserDTO dto = us.getuser(id);

		String path = "C:/Noljyu/Team-noljyu/src/main/webapp/image";
		File file = new File(path + "/" + dto.getPhoto());
		if (file.exists()) file.delete();

		us.delete2(id);
		session.invalidate();
		HttpSession newSession = request.getSession();
		newSession.setAttribute("msg", "회원 탈퇴 완료되었습니다.");
		return "redirect:/main";
	}
	
	// 비밀번호 확인 페이지 이동
	@RequestMapping("/pwcheck")
	public String pwCheckPage(HttpServletRequest request, Model model) {
		String type = request.getParameter("type");
		model.addAttribute("type", type);
		return "pwcheck"; 
	}

	// 비밀번호 확인 처리
	@RequestMapping(value = "/pwcheckdo", method = RequestMethod.POST)
	public String pwCheckDo(HttpServletRequest request, HttpSession session, Model model) {
		String inputPw = request.getParameter("pw");
		String type = request.getParameter("type");
		String id = (String) session.getAttribute("id");

		if (id == null)
			return "redirect:/login";

		UserService us = sqlSession.getMapper(UserService.class);
		UserDTO dto = us.getuser(id);

		PasswordEncoder pe = new BCryptPasswordEncoder();
		if (dto != null && pe.matches(inputPw, dto.getPw())) {
			// 비밀번호 일치: 목적 페이지로 이동
			if ("modify".equals(type)) {
				return "redirect:/modify1?id=" + id;
			} else if ("delete".equals(type)) {
				return "redirect:/delete1";
			}
		}

		// 비밀번호 불일치
		model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		model.addAttribute("type", type);
		return "pwcheck";
	}
}
