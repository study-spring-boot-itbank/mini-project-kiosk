package com.mini.pro.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class LoginVO implements UserDetails {
	//minilogin 테이블의 칼럼
	

	private static final long serialVersionUID = 1L;
	private String id;
	private String password;
	private String role;
	
	//userDetails 기본상속변수
	private Collection<? extends GrantedAuthority> authorities;
	private boolean isEnabled = true;
	private String username;
	private boolean isCredentialsNonExpired = true;
	private boolean isAccountNonExpired = true;
	private boolean isAccountNonLocked = true;
	
}
