package com.sonsoo.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductCriteria {
	private int pageNum;//페이지 번호
	private int amount;//페이지당 글 갯수
	
	//검색타입, 검색어저장 속성
	private String category;//분류
	private String type;//제목/판매자
	private String keyword;//검색어
	
	public ProductCriteria() {
		this(1,8);
	}
	
	public ProductCriteria(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	public String[] getTypeArr() {
		return type==null?new String[] {}:type.split("");
	}

}
