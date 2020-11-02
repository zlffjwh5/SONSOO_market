package com.sonsoo.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class NoticePageDTO {
	private int startPage; 			   //시작페이지
	private int endPage; 			  //종료페이지
	private boolean prev, next; //이전,다음여부
	
	private int total;					//전체 건수
	private NoticeCriteria cri;
	
	public NoticePageDTO(NoticeCriteria cri,int total) {
		this.total = total;
		this.cri = cri;
	
		//페이징 신식처리
		this.endPage = (int)(Math.ceil(cri.getPageNum()/5.0))*5;
		
		this.startPage = this.endPage-4;
		
		//실제 마지막 페이지
		int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount())); 
		
		//마지막 페이지 보정
		if(realEnd<=this.endPage) this.endPage=realEnd;
		
		//이전 페이지 다음 페이지 존재 여부
		this.prev=this.startPage>1;
		this.next=this.endPage<realEnd;
		
	} 
	
}
