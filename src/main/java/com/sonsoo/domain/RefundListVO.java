package com.sonsoo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RefundListVO {
	private String o_number; 	//주문번호
	private String p_id; 				//상품코드
	private int qty; 					//상품 수량
	private int price;					//상품 가격
	private Date requestDate;	//환불신청날짜
	private Date refundDate;		//환불날짜
	private String refundMeans;//환불방법 (택배, 수거)
	private String refundSystem;//환불방식 (구매취소, 반품신청)
	private String id; 				//신청자 아이디
	private String name;			//신청자 이름
	private String phone;			//전화번호
	private String postcode;		//우편번호
	private String address;		//주소
	private int totalCost;			//환불금액
}
