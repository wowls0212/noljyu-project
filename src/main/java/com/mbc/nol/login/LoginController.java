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

	// �α��� ������
	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}

	// �Ϲ� �α��� üũ
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
			session.setAttribute("msg", "ȯ���մϴ�, " + id + "��!");

			return "redirect:/main";
		} else {
			response.setContentType("text/html;charset=utf-8");
			try (java.io.PrintWriter out = response.getWriter()) {
				out.print("<script>alert('���̵� �Ǵ� �н����尡 �ٸ��ϴ�.\\n�ٽ� Ȯ�� �� �α��� ���ּ���.'); location.href='login';</script>");
			}
			return "redirect:/login";
		}
	}

	// �α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main";
	}
	// ��й�ȣ ã��
	@RequestMapping("/passwordFind")
	public String passwordFindPage() {
		return "passwordFind"; 
	}
	}
