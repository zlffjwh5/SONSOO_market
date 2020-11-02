package com.sonsoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.FAQVO;
import com.sonsoo.mapper.FAQMapper;
import com.sonsoo.paging.FAQCriteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class FAQServiceImpl implements FAQService{
	
	private FAQMapper qm;

	@Override
	public void insert(FAQVO vo) {
		qm.insert(vo);
	}

	@Override
	public FAQVO get(Long bno) {
		qm.updateReadCnt(bno);
		return qm.get(bno);
	}

	@Override
	public boolean modify(FAQVO vo) {
		return qm.update(vo)==1;
	}

	@Override
	public boolean remove(Long bno) {
		return qm.remove(bno)==1;
	}

	@Override
	public List<FAQVO> getListWithPaging(FAQCriteria cri) {
		return qm.getListWithPaging(cri);
	}

	@Override
	public int getTotal(FAQCriteria cri) {
		return qm.getTotalCount(cri);
	}

}
