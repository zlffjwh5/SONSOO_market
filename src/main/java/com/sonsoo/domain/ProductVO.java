package com.sonsoo.domain;

import lombok.Data;

@Data
public class ProductVO {
	private String p_id;//상품아이디
	private String name;//상품이름
	private String category;//상품종류-외래키
	private int price;//가격
	private int stock;//재고
	private int sale;//판매
	private int likey;//좋아요
	private int cnt;//조회수
	private String script;//상품설명
	private String tnImage;//썸네일이미지
	private String dsImage;//상세이미지
	private String id;//판매자아이디
}
