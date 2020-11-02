package com.sonsoo.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ProductPageDTO {

	private int startPage;//시작페잊
	private int endPage;//종료페이지
	private boolean prev,next;//이전,다음 여부
	
	private int total;//전체 건수
	private ProductCriteria cri;//페이징 파라미터
	
	//생성자
	public ProductPageDTO(ProductCriteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//페이징 산식처리
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;// 10/10.0=0.0, 12/10/0=1.2=> 2, 10
		
		this.startPage=this.endPage-9; //10-9 =1
		
		//실제 마지막페이지
		int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount())); //52.0/10 = 5.2-> (int)(6.0) =6 마지막페이지 
		
		//마지막 페이지 보정
		if(realEnd <=this.endPage) {// 12 ,13
			this.endPage=realEnd;
		}
		
		//이전 페이지, 다음 페이지 존재 여부 
		this.prev = this.startPage > 1;//true/false
		this.next=this.endPage<realEnd;//true/false
		
	}
	
	
	
	
	

}
