package com.sonsoo.paging;

import lombok.Data;

@Data
public class NoticeCriteria { 
	private int pageNum; 
	private int amount; 	//페이지당 글 갯수
	
	//검색타입, 검색어 저장 속성 
	private String type; 	//카테고리 명
	private String keyword; //검색 내용
	
	public NoticeCriteria() { 
		this(1,5); 
	}
	
	public NoticeCriteria(int pageNum,int amount) { 
		this.pageNum=pageNum; 
		this.amount=amount; 
	}
	
	public String[] getTypeArr() { 
		return type==null?new String[] {}:type.split("");
	}
	
	
	
}
