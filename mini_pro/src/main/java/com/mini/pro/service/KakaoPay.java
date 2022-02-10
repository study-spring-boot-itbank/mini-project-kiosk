package com.mini.pro.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.mini.pro.vo.KakaoPayReadyVO;
import com.mini.pro.vo.PayinfoVO;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPay {
	//https://scorpio-mercury.tistory.com/10 참고한곳
	
	private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    
    public String kakaoPayReady(PayinfoVO payinfoVO) {
 
        RestTemplate restTemplate = new RestTemplate();
    
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "ad17c284ad1f70214c0c83d2446764db");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");			//가맹점의코드 현재는 테스트용
        params.add("partner_order_id", "1001");		//주문번호 미구현 고정값을 보냄
        params.add("partner_user_id",payinfoVO.getId());	//로그인한 id를 feign으로 받아오자
        params.add("total_amount", Integer.toString(payinfoVO.getPrice()));			//총 가격
        params.add("item_name", "커피?");
        params.add("quantity", "1");
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8911/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8911/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8911/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }

}
