package com.sonsoo.mapper;

import java.util.List;

import com.sonsoo.domain.FAQVO;
import com.sonsoo.paging.FAQCriteria;

public interface FAQMapper {
	
	public void insert(FAQVO vo);
	
	public List<FAQVO> getListWithPaging(FAQCriteria cri);
	
	public FAQVO get(Long bno);
	
	public int remove(Long bno);
		
	public int update(FAQVO vo);
	
	public int getTotalCount(FAQCriteria cri);
	
	public void updateReadCnt(Long bno);

}
