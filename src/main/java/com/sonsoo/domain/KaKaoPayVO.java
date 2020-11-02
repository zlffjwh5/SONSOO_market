package com.sonsoo.domain;

import java.net.URI;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.Data;

@Service
@Data
public class KaKaoPayVO {
	
  private final String cid = "TC0ONETIME";
  private String partner_order_id;
  private String partner_user_id;
  private String item_name;
  private String quantity;
  private String total_amount;
  private final String tax_free_amount = "0";
  private final String approval_url = "http://localhost:8909/order/kakaoPaySuccess";
  private final String cancel_url = "http://localhost:8909/order/kakaoPayCancel";
  private final String fail_url = "http://localhost:8909/order/kakaoPaySuccessFail";
  
  private static final String HOST = "https://kapi.kakao.com";
  
  private KakaoPayReadyVO readyVO;
  private KakaoPayApprovalVO approvalVO;
  
  
  
  
  public String kakaoPayReady(KaKaoPayVO vo) {

	  RestTemplate restTemplate = new RestTemplate();
	  
	  HttpHeaders headers = new HttpHeaders();
	  	headers.add("Authorization", "KakaoAK " + "c70c8e0cd1158c43840bb8dadcb0146e");
	  	headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	  	headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
      
      // 서버로 요청할 Body
      MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
      
      params.add("cid", cid);
      params.add("partner_order_id", vo.getPartner_order_id()); 
      params.add("partner_user_id", vo.getPartner_user_id()); 
      params.add("item_name", vo.getItem_name()); 
      params.add("quantity", vo.getQuantity()); 
      params.add("total_amount", vo.getTotal_amount()); 
      params.add("tax_free_amount", vo.getTax_free_amount()); 
      params.add("approval_url", approval_url); 
      params.add("cancel_url", cancel_url); 
      params.add("fail_url", fail_url); 
      
      this.partner_order_id = vo.getPartner_order_id();
      this.partner_user_id= vo.getPartner_user_id();
      this.item_name = vo.getItem_name();
      this.quantity = vo.getQuantity(); 
      this.total_amount = vo.getTotal_amount();
      
      HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
      
      try {
        	  readyVO = restTemplate.postForObject(new URI(HOST+"/v1/payment/ready"), body, KakaoPayReadyVO.class);
        	  System.out.println("___________________카카오페이 결제 URL 입니다. 해당 주소를 복사한 후 주소창에 입력하세요");
        	  System.out.println("___________________"+readyVO.getNext_redirect_pc_url());
        	  
      } catch (Exception e) {e.printStackTrace();}        
      
     return readyVO.getNext_redirect_pc_url();
  }
  
  
  
  public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
      
      RestTemplate restTemplate = new RestTemplate();

      // 서버로 요청할 Header
      HttpHeaders headers = new HttpHeaders();
      headers.add("Authorization", "KakaoAK " + "c70c8e0cd1158c43840bb8dadcb0146e");
      headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
      headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

      // 서버로 요청할 Body
      MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
      params.add("cid", cid);
      params.add("pg_token", pg_token);
      params.add("tid", readyVO.getTid());
      params.add("partner_order_id", partner_order_id);
      params.add("partner_user_id", partner_user_id);
      params.add("pg_token", pg_token);
      params.add("total_amount", total_amount);
      
      HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
      
      try {
          approvalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
          return approvalVO;
      
      } catch (Exception e) {e.printStackTrace(); }
      
      return approvalVO;
  }
  
  
}
