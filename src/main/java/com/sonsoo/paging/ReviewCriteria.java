package com.sonsoo.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewCriteria {

	private int pageNum;
	private int amount;
	
	public ReviewCriteria() {
		
		this(1,3);
		
	}
	
	public ReviewCriteria(int pageNum, int amount) {
		
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
}
