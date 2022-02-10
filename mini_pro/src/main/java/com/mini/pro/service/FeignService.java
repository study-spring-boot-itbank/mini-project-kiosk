package com.mini.pro.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mini.pro.vo.PayinfoVO;

@FeignClient(name = "giveme-info", url = "http://localhost:8912/pay/")
public interface FeignService {
	
	@GetMapping("Kakao")
	String kakao();
	
	@GetMapping("dell")
	void dell();
	
}
