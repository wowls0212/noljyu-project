package com.mbc.nol.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController {
	@Autowired
	SqlSession sqlSession;

	// 로그인 페이지
	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}

	// 일반 로그인 체크
	@RequestMapping("/logincheck")
	public String loginCheck(HttpServletRequest request, HttpServletResponse response) throws java.io.IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		LoginService loginService = sqlSession.getMapper(LoginService.class);
		String encodedPw = loginService.pwsearch(id);

		PasswordEncoder pe = new BCryptPasswordEncoder();

		if (encodedPw != null && pe.matches(pw, encodedPw)) {
			HttpSession session = request.getSession();
			session.setAttribute("loginstate", true);
			session.setAttribute("id", id);

			String adminStatus = loginService.getAdminStatus(id);
			session.setAttribute("admin", adminStatus);
			session.setAttribute("msg", "환영합니다, " + id + "님!");

			return "redirect:/main";
		} else {
			response.setContentType("text/html;charset=utf-8");
			try (java.io.PrintWriter out = response.getWriter()) {
				out.print("<script>alert('아이디 또는 패스워드가 다릅니다.\\n다시 확인 후 로그인 해주세요.'); location.href='login';</script>");
			}
			return "redirect:/login";
		}
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main";
	}
	// 비밀번호 찾기
	@RequestMapping("/passwordFind")
	public String passwordFindPage() {
		return "passwordFind"; 
	}
	}
