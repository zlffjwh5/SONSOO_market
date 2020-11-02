package com.sonsoo.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FundingCriteria {
	private int pageNum;
	private int amount; //페이지당 글 갯수
	 //검색타입, 검색어저장 속성
	private String type; //카테고리명
	private String keyword; //검색 내용
	
	public FundingCriteria() {
		this(1,8);
	}
	public FundingCriteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount=amount;
	}
	
	public String[] getTypeArr() {
		      return type==null?new String[] {}:type.split("");
	}
	
}
