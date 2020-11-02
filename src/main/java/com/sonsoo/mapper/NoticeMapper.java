package com.sonsoo.mapper;

import java.util.List;

import com.sonsoo.domain.NoticeVO;
import com.sonsoo.paging.NoticeCriteria;

public interface NoticeMapper {
	
	public void insert(NoticeVO vo);
	
	public List<NoticeVO> getListWithPaging(NoticeCriteria cri);
	
	public NoticeVO get(Long bno);
	
	public int remove(Long bno);
		
	public int update(NoticeVO vo);
	
	public int getTotalCount(NoticeCriteria cri);
	
	public void updateReadCnt(Long bno);

}
