package com.sonsoo.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageCriteria {

	private int pageNum;
	private int amount;
	
	public MessageCriteria() {
		
		this(1,10);
		
	}
	
	public MessageCriteria(int pageNum, int amount) {
		
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
}
