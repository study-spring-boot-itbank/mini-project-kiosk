package com.mini.pro.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.mini.pro.vo.LoginVO;

public interface SecurityService extends UserDetailsService{
	public UserDetails loadUserByUsername(String id);
	//public int joinHaja(LoginVO loginVO) throws Exception;
}
