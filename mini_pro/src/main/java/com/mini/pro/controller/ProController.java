package com.mini.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mini.pro.dao.MiniPDAO;
import com.mini.pro.service.FeignService;
import com.mini.pro.service.SecurityService;
import com.mini.pro.vo.LoginVO;
import com.mini.pro.vo.PayinfoVO;

import lombok.extern.java.Log;

@Log
@Controller
public class ProController {
	@Autowired
	SecurityService securityService;
	@Autowired
	MiniPDAO miniPDAO;
	@Autowired
	PasswordEncoder pwEncoder;
	
	FeignService feignService;
	
	
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
	
	
	@GetMapping("/login")
	public String login() {
		return "/userLogin";
	}
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/toResult")
	public String loginKajaMain(HttpSession session,Authentication authentication) {
		//session.setAttribute("pid", "테스트");
		String pid2 = null;
		if (authentication != null)
            pid2 = authentication.getName();
        else
            pid2 = "실패";
		session.setAttribute("pid2", pid2);
		//session.getAttribute("pid");
		return "result";
	}
	
	@GetMapping("paypay/{id}")
	public String paypay(@PathVariable("id") String id,HttpSession session) {
		session.setAttribute("pid", id);
		return "paypay";
	}
	
	@GetMapping("ftest2")
	public String ftest2(Model model) {
		PayinfoVO payinfoVO;
		feignService.kakao();
		model.addAttribute("mol",feignService.kakao());
		return "ft";
	}
	
	@GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
    }
	
}
