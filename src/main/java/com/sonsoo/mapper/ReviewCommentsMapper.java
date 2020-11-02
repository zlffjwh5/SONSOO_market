package com.sonsoo.mapper;

import java.util.List;

import com.sonsoo.domain.ReviewCommentsVO;


public interface ReviewCommentsMapper {

	public List<ReviewCommentsVO> getReviewCommentsList(ReviewCommentsVO rcvo);
	
	public int insertReviewComments(ReviewCommentsVO rcvo);
	
	public int deleteReviewComments(ReviewCommentsVO rcvo);
	
}
