package com.sonsoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonsoo.domain.ReviewCommentsVO;
import com.sonsoo.mapper.ReviewCommentsMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReviewCommentsServiceImpl implements ReviewCommentsService{

	private ReviewCommentsMapper rcm;
	
	@Override
	public List<ReviewCommentsVO> getReviewCommentsList(ReviewCommentsVO rcvo) {
		
		return rcm.getReviewCommentsList(rcvo);
	}

	@Override
	public int insertReviewComments(ReviewCommentsVO rcvo) {
		
		return rcm.insertReviewComments(rcvo);
	}

	@Override
	public int deleteReviewComments(ReviewCommentsVO rcvo) {
		
		return rcm.deleteReviewComments(rcvo);
	}

}
