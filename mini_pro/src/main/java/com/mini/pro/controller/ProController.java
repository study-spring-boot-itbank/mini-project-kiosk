package com.mini.pro.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mini.pro.dao.MiniPDAO;
import com.mini.pro.service.SecurityService;
import com.mini.pro.vo.LoginVO;

@Controller
public class ProController {
	@Autowired
	SecurityService securityService;
	@Autowired
	MiniPDAO miniPDAO;
	@Autowired
	PasswordEncoder pwEncoder;
	
	//회원가입
	@GetMapping("/join")
	public String join() {
		return "/join";
	}
	
	@RequestMapping(value = "/joinOK" , method = RequestMethod.POST)
	public String joinok(@RequestParam("joinid")String id,@RequestParam("joinpassword")String pw) {
		LoginVO loginVO = new LoginVO();
		loginVO.setId(id);
		loginVO.setPassword(pwEncoder.encode(pw));
		//System.out.println(loginVO.getId());
		//System.out.println(loginVO.getPassword());
		miniPDAO.joinHaja(loginVO);
		//miniPDAO.joinHaja(id,pw);
		return "redirect:/";
	}
	
//	@RequestMapping("/joinOK")
//	public String joinnew(HttpServletRequest hsr) {
//		LoginVO loginVO = new LoginVO();
//		loginVO.setId(hsr.getParameter("joinid"));
//		loginVO.setPassword(hsr.getParameter("joinpassword"));
//		System.out.println(hsr.getParameter("joinid"));
//		System.out.println(hsr.getParameter("joinpassword"));
//		String id = hsr.getParameter("joinid");
//		String password = hsr.getParameter("joinpassword");
//		miniPDAO.joinHaja(id,password);
//		return "redirect:/";
//	}
	
	@GetMapping("/login")
	public String login() {
		return "/userLogin";
	}
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/toResult")
	public String loginKajaMain() {
		return "result";
	}
	
}
