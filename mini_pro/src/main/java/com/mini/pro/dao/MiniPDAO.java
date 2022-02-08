package com.mini.pro.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mini.pro.vo.LoginVO;

@Mapper
public interface MiniPDAO {
	public void joinHaja(LoginVO loginVO);
	public LoginVO finduser(String username);
	//public void joinHaja(String id, String password);
}
