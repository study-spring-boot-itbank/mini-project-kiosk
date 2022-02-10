package com.mini.pro.vo;

import lombok.Data;

@Data
public class PayinfoVO {
	//feign으로 받아온값 저장할곳
	private String id;
	private int price; 
}
