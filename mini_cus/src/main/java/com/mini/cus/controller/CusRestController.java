package com.mini.cus.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mini.cus.dao.MiniDAO;
import com.mini.cus.vo.PayinfoVO;

@RestController
@RequestMapping(value="/pay" )
public class CusRestController {
	@Autowired
	MiniDAO miniDAO;
	
	@GetMapping(value="/Kakao", produces = MediaType.APPLICATION_JSON_VALUE)
	public PayinfoVO Kakao(HttpSession session) {
		
		 PayinfoVO payinfoVO = new PayinfoVO(); 
		 //payinfoVO.setId("테스트");
		 payinfoVO.setPrice(miniDAO.sumall());
		 
		//System.out.println(payinfoVO.getId());
		System.out.println(payinfoVO.getPrice());
		return payinfoVO;
	}
	
	@GetMapping(value = "/dell")
	public void dell(HttpServletResponse response) throws IOException {
		miniDAO.delall();
		response.sendRedirect("/");
	}
	 
	
}
