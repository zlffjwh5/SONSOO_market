package com.sonsoo.service;

import java.util.List;

import com.sonsoo.domain.NoticeVO;
import com.sonsoo.paging.NoticeCriteria;

public interface NoticeService {
	
	  //글 입력
	  public void insert(NoticeVO vo);
	  
	  //글 조회
	  public NoticeVO get(Long bno);
	  
	  //글 수정
	  public boolean modify(NoticeVO vo);
	  
	  //글 삭제
	  public boolean remove(Long bno);
	  
	  //글 목록 조회
	  public List<NoticeVO> getListWithPaging(NoticeCriteria cri);
	 
	  //글 전체 건수 조회
	  public int getTotal(NoticeCriteria cri);

}
