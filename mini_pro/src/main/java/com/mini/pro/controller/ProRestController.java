package com.mini.pro.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mini.pro.service.FeignService;
import com.mini.pro.service.KakaoPay;
import com.mini.pro.vo.PayinfoVO;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping(value="/feign", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProRestController {
	private FeignService feignService;
	
	@Autowired
	KakaoPay kakaoPay;
	
	public ProRestController(FeignService feignService) {
		// TODO Auto-generated constructor stub
		this.feignService = feignService;
	}
	
	@GetMapping("ftest")
	public ModelAndView ftest() {
		Gson gson = new Gson();
		PayinfoVO payinfoVO = new PayinfoVO();
		payinfoVO = gson.fromJson(feignService.kakao(), PayinfoVO.class);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ft");
		mav.addObject("mol",feignService.kakao());
		mav.addObject("mol2",payinfoVO);
		mav.addObject("mol3",payinfoVO.getId());
		mav.addObject("mol4",payinfoVO.getPrice());
		kakaoPay.kakaoPayReady(payinfoVO);
		return mav;
	}
	
	@GetMapping("/kakaoPay")
    public void kakaoPay(HttpServletResponse response,HttpSession session) throws IOException {
        log.info("kakaoPay post............................................");
        Gson gson = new Gson();
		PayinfoVO payinfoVO = new PayinfoVO();
		payinfoVO = gson.fromJson(feignService.kakao(), PayinfoVO.class);
        payinfoVO.setId((String) session.getAttribute("pid"));
        session.setAttribute("sumsum", payinfoVO.getPrice());
        String redirect_uri=kakaoPay.kakaoPayReady(payinfoVO);
    	response.sendRedirect(redirect_uri);
    }
	
	@GetMapping("/wan")
	public void wan() {
		feignService.dell();
	}
	
}
