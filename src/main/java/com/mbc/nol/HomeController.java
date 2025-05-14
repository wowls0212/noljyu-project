package com.mbc.nol;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mbc.nol.community.ComDTO;
import com.mbc.nol.community.ComService;
import com.mbc.nol.flea.FleaDTO;
import com.mbc.nol.flea.FleaService;
import com.mbc.nol.how.HowDTO;
import com.mbc.nol.how.HowService;

@Controller
public class HomeController {

	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/")
    public String home(HttpServletRequest request, Model model) {
        HttpSession hs = request.getSession();
        HowService hhs = sqlsession.getMapper(HowService.class);
        FleaService fs = sqlsession.getMapper(FleaService.class);
        ComService cs = sqlsession.getMapper(ComService.class);
        HowDTO dto = hhs.best();
        FleaDTO fdto = fs.fbest();
        ComDTO cdto = cs.cbest();
        hs.setAttribute("loginstate", false);
        model.addAttribute("dto", dto);
        model.addAttribute("fdto",fdto);
        model.addAttribute("cdto", cdto);
        return "main";
    }

    @RequestMapping(value = "/main")
    public ModelAndView main(HttpSession session, Model model) {
        String admin = (String) session.getAttribute("admin");;
        ModelAndView mav = new ModelAndView("main");
        HowService hhs = sqlsession.getMapper(HowService.class);
        FleaService fs = sqlsession.getMapper(FleaService.class);
        ComService cs = sqlsession.getMapper(ComService.class);
        HowDTO dto = hhs.best();
        FleaDTO fdto = fs.fbest();
        ComDTO cdto = cs.cbest();
        if ("admin".equals(admin)) {
            mav.addObject("topPath", "/WEB-INF/views/top.jsp");
            model.addAttribute("dto",dto);
            model.addAttribute("fdto",fdto);
            model.addAttribute("cdto", cdto);
        } else {
            mav.addObject("topPath", "/WEB-INF/views/top_user.jsp");
            model.addAttribute("dto", dto);
            model.addAttribute("fdto",fdto);
            model.addAttribute("cdto", cdto);
        }
        return mav;
    }
	
}
