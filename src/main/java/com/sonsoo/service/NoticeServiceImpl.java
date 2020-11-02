package com.sonsoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.NoticeVO;
import com.sonsoo.mapper.NoticeMapper;
import com.sonsoo.paging.NoticeCriteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class NoticeServiceImpl implements NoticeService{
	
	private NoticeMapper nm;

	@Override
	public void insert(NoticeVO vo) {
		nm.insert(vo);
	}

	@Override
	public NoticeVO get(Long bno) {
		nm.updateReadCnt(bno);
		return nm.get(bno);
	}

	@Override
	public boolean modify(NoticeVO vo) {
		return nm.update(vo)==1;
	}

	@Override
	public boolean remove(Long bno) {
		return nm.remove(bno)==1;
	}

	@Override
	public List<NoticeVO> getListWithPaging(NoticeCriteria cri){
		return nm.getListWithPaging(cri);
	}

	@Override
	public int getTotal(NoticeCriteria cri) {
		return nm.getTotalCount(cri);
	}

}
