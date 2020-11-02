package com.sonsoo.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReviewPagingDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private ReviewCriteria cri;
	
	public ReviewPagingDTO(ReviewCriteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 3.0)) * 3;
		
		this.startPage = this.endPage - 2;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			
			this.endPage = realEnd;
			
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
	
}
