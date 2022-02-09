package com.mini.cus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mini.cus.vo.CartVO;
import com.mini.cus.vo.MenuVO;

@Mapper
public interface MiniDAO {
	public List<MenuVO> getAllMenu();
	public int addCart(String menu,String img,String price);
	public List<CartVO> getAllCart();
	public void delCart(String menu);
	public void delall();
	public Integer sumall();
}
