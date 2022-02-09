package com.mini.cus.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mini.cus.dao.MiniDAO;
import com.mini.cus.vo.CartVO;
import com.mini.cus.vo.MenuVO;

@Controller
public class CusController {
	@Autowired
	private MiniDAO minidao;
	
	@RequestMapping("/")// 모든요청 처리
	public String boom() {
		return "redirect:index";
	}
	
	/*
	 * @RequestMapping("/index") public String index() { return "index"; }
	 */
	
	@RequestMapping("/index")
	public String getM(Model model) {
		List<MenuVO> mvo = minidao.getAllMenu();
		model.addAttribute("menuList", mvo);
		List<CartVO> lcvo = minidao.getAllCart();
		model.addAttribute("cartList", lcvo);
		return "index";
	}
	
	@RequestMapping(value = "/addCart" , method = RequestMethod.POST)
	public String addCart(CartVO cvo,Model model) {
		int num = minidao.addCart(cvo.getMenu(),cvo.getImg(),cvo.getPrice());
//		List<CartVO> lcvo = minidao.getAllCart();
//		model.addAttribute("cartList", lcvo);
		return "redirect:index";
	}
	
	@RequestMapping(value = "/delCart" , method = RequestMethod.POST)
	public String delCart(CartVO cvo,Model model) {
		String menu = cvo.getMenu();
		minidao.delCart(menu);
		return "redirect:index";
	}

	/*
	 * @RequestMapping("/showCart") public String getC(Model model) {
	 * 
	 * return "redirect:index"; }
	 * 
	 */
	
	
	/*
	 * @RequestMapping("/cart") public String insert(@ModelAttribute CartVO
	 * cVo,HttpSession session) { cvo.setMenu(menu); cvo.setImg(img);
	 * cvo.setPrice(price); return "cart"; }
	 * 
	 * @RequestMapping("insertCart") public String addCart(CartVO cvo, HttpSession
	 * session,@RequestParam("item")int item, Model model) { int result = 0; } int
	 * sessionId =
	 * Integer.parseInt(session.getAttribute(name:"sessionId").toString());
	 * 
	 * result = cartService.addCart(cart,item,sessionId);
	 * 
	 * model.addAttribute(attributeName "result, result) return ""; }
	 */
}
