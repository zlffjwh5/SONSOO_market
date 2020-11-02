package com.sonsoo.service;

import java.util.List;

import com.sonsoo.domain.FAQVO;
import com.sonsoo.paging.FAQCriteria;

public interface FAQService {
	
	  //글 입력
	  public void insert(FAQVO vo);
	  
	  //글 조회
	  public FAQVO get(Long bno);
	  
	  //글 수정
	  public boolean modify(FAQVO vo);
	  
	  //글 삭제
	  public boolean remove(Long bno);
	  
	  //글 목록 조회
	  public List<FAQVO> getListWithPaging(FAQCriteria cri);
	 
	  //글 전체 건수 조회
	  public int getTotal(FAQCriteria cri);

}
