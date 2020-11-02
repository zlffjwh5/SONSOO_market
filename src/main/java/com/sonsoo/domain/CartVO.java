package com.sonsoo.domain;

import lombok.Data;

@Data
public class CartVO {
	private int seq;//seq
	private String id;//회원아이디
	private String p_id;//상품아이디
	private int quantity;//주문수량
	private String name;//상품이름
	private int price;//상품가격
	private String tnImage;//상품이미지
}
