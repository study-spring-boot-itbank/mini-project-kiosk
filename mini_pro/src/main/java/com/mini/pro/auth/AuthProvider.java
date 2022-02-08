package com.mini.pro.auth;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.mini.pro.service.SecurityService;
import com.mini.pro.vo.LoginVO;

@Component
public class AuthProvider implements AuthenticationProvider{
	
	@Autowired
	SecurityService securityService;
	
//	private final PasswordEncoder pwEncoder;
//	
//	 public AuthProvider(PasswordEncoder passwordEncoder) {
//	        this.pwEncoder = passwordEncoder;
//	    }
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
//	@Autowired
//	public AuthProvider(PasswordEncoder pwEncoder) {
//		// TODO Auto-generated constructor stub
//		this.pwEncoder = pwEncoder;
//	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		String id = authentication.getName();
		//String password = authentication.getCredentials().toString();
		String password = (String)authentication.getCredentials();
		//String password = pwEncoder.encode(authentication.getCredentials().toString());
		//String password = pwEncoder.encode(rawpassword);
		return authenticate(id,password);
	}

	private Authentication authenticate(String id, String password) {
		// TODO Auto-generated method stub
		List<GrantedAuthority> grantedAuthorityList = new ArrayList<GrantedAuthority>();
		LoginVO loginVO = new LoginVO();
		loginVO = (LoginVO) securityService.loadUserByUsername(id);
		if(loginVO == null) {
			throw new UsernameNotFoundException(id);
//		}else if (loginVO != null && !loginVO.getPassword().equals(password)) {
//			throw new BadCredentialsException(id);
//		}
		}else if(!pwEncoder.matches(password, loginVO.getPassword())){
			throw new BadCredentialsException("비밀번호가 틀려요");
		}
		grantedAuthorityList.add(new SimpleGrantedAuthority(loginVO.getRole()));
		return new MyAuthentication(id,password,grantedAuthorityList,loginVO);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
