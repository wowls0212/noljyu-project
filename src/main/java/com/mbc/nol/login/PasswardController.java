package com.mbc.nol.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbc.nol.user.UserDTO;
import com.mbc.nol.user.UserService;

@Controller
public class PasswardController {

    @Autowired
    SqlSession sqlSession;

    // ID + 반려동물 이름 입력 폼
    @RequestMapping(value = "passwordfind")
    public String passwordFindPage() {
        return "passwordFind";
    }

    // ID + 반려동물 이름 확인 → 비밀번호 재설정 폼으로 이동
    @RequestMapping(value = "passwordfindProcess")
    public String passwordFindProcess(HttpServletRequest request, Model model) {
        String id = request.getParameter("id");
        String petName = request.getParameter("petName");

        UserService us = sqlSession.getMapper(UserService.class);
        UserDTO user = us.getuser(id);

        if (user != null && user.getPetName().equals(petName)) {
            model.addAttribute("id", id);
            return "passwordReset";
        } else {
            model.addAttribute("msg", "입력하신 정보(ID 또는 반려동물 이름)가 일치하지 않습니다.");
            return "passwordFind";
        }
    }

    // 새 비밀번호 입력 후 DB에 업데이트
    @RequestMapping(value = "passwordresetProcess")
    public String passwordResetProcess(HttpServletRequest request, HttpSession session, Model model) {
        String id = request.getParameter("id");
        String newPassword = request.getParameter("newPassword");

        if (newPassword == null || newPassword.trim().isEmpty()) {
            model.addAttribute("msg", "새 비밀번호를 입력해주세요.");
            model.addAttribute("id", id);
            return "passwordReset";
        }

        PasswordEncoder pe = new BCryptPasswordEncoder();
        String encodedPw = pe.encode(newPassword);

        UserService us = sqlSession.getMapper(UserService.class);
        us.modify3(id, encodedPw);  // 비밀번호 업데이트

        session.setAttribute("msg", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인 해주세요.");
        return "redirect:/";
    }
}
