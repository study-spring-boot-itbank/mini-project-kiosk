package com.mini.pro.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.mini.pro.auth.AuthProvider;

@Configuration
@EnableWebSecurity
public class MiniSecurity extends WebSecurityConfigurerAdapter{
//	@Autowired
//	AuthProvider authProvider;
	
	@Override
	protected void configure(AuthenticationManagerBuilder amb) throws Exception{
		amb.authenticationProvider(authenticationProvider());
	}
	
	@Bean
    public AuthenticationProvider authenticationProvider() {
        return new AuthProvider();
    }
	
	@Override
	protected void configure(HttpSecurity hs) throws Exception{
		hs.csrf().disable();
		
		hs.authorizeRequests()
			//.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			//.antMatchers("/user/**").permitAll();
			.antMatchers("/**").permitAll();
		hs.formLogin()
			.loginPage("/userLogin")
			.loginProcessingUrl("/loginHaja")
			//로그인 성공시 toResul로 이동
			.defaultSuccessUrl("/toResult", true);
			
		hs.logout()
			//.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))// 이경로로 로그아웃 요청시
			.logoutUrl("/logout")	// 이 주소로 보내고
			.invalidateHttpSession(true);	//세션을 초기화한다
		
	}
	
	@Override
	public void configure(WebSecurity webSecurity) throws Exception	{
		webSecurity.ignoring()
			.antMatchers("/api/**","/resources/**");
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
//	@Bean(name = "passwordEncoder2")
//	@Qualifier("passwordEncoder2")
//	public PasswordEncoder passwordEncoder2() {
//	    return PasswordEncoderFactories.createDelegatingPasswordEncoder();
//	}
	
}


