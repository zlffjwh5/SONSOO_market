package com.sonsoo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private String o_number;				//주문 번호(o는 order의 약자)
	private String p_id;						//상품 코드 번호
	private String p_name;				//상품이름
	private String script;					//상품설명
	private int price;							//가격
	private int qty;							//주문 수량
	private Date o_date;					//주문일
	private String status;					//주문 상태
	private String tnImage;					//상품 이미지
	
	private String id;							//주문자  아이디
	
	private String name;					//수령인	 이름
	private String phone;					//			전화번호
	private String postcode;				//			우편번호
	private String address;				//			주소
	private String detailAddress;		//			상세 주소
	private String extraAddress;		//참고 주소
	private String requestedTerm;		//주문시 요청사항
	
	private String couponUsed;			//사용된 쿠폰
	private int totalCost;					//총 금액
	
}//class