package com.sonsoo.service;

import java.util.List;

import com.sonsoo.domain.ReviewCommentsVO;

public interface ReviewCommentsService {

	public List<ReviewCommentsVO> getReviewCommentsList(ReviewCommentsVO rcvo);
	
	public int insertReviewComments(ReviewCommentsVO rcvo);
	
	public int deleteReviewComments(ReviewCommentsVO rcvo);
	
}
