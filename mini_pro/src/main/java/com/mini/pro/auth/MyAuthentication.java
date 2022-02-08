package com.mini.pro.auth;

import java.util.List;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import com.mini.pro.vo.LoginVO;

import lombok.Data;


@Data
public class MyAuthentication extends UsernamePasswordAuthenticationToken {
	//현재 인증한 사용자
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	LoginVO loginVO;
	
	public MyAuthentication(String id, String password ,List<GrantedAuthority> grantedAuthorityList, LoginVO loginVO) {
		super(id,password,grantedAuthorityList);
		this.loginVO = loginVO;
	}

}
