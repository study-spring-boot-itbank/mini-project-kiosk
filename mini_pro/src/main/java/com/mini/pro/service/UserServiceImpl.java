package com.mini.pro.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mini.pro.dao.MiniPDAO;
import com.mini.pro.vo.LoginVO;

@Service
public class UserServiceImpl implements SecurityService{
	
	@Autowired
	MiniPDAO miniPDAO;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException{
		LoginVO loginVO = miniPDAO.finduser(id);
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		if(loginVO != null) {
			authorities.add(new SimpleGrantedAuthority(loginVO.getRole()));
			loginVO.setAuthorities(authorities);
		}
		return loginVO;
	}

//	@Override
//	public int joinHaja(LoginVO loginVO) throws Exception{
//		// TODO Auto-generated method stub
//		return miniPDAO.joinHaja(loginVO);
//	}

}
