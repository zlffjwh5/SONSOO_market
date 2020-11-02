package com.sonsoo.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HistoryCriteria {

	private int pageNum;
	private int amount; //페이지당 글 갯수
	 //검색타입, 검색어저장 속성
	/*
	private String type;
	private String keyword;
	*/
	public HistoryCriteria() {
		this(1,5);
	}
	public HistoryCriteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount=amount;
	}
	/*
	public String[] getTypeArr() {
		      return type==null?new String[] {}:type.split("");
	}
	*/
}
