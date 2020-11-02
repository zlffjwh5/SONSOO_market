package com.sonsoo.mapper;

import java.util.List;

import com.sonsoo.domain.ReviewVO;



public interface ReviewMapper {
	
	//public List<ReviewVO> getReviewList(ReviewVO vo);
	
	public List<ReviewVO> getReviewListWithPaging(ReviewVO vo);
	
	public void insertReview(ReviewVO vo);
	
	public ReviewVO getReview(ReviewVO vo);
	
	public void deleteReview(ReviewVO vo);
	
	public void updateReview(ReviewVO vo);
	
	public String getReviewStarAvg(ReviewVO vo);
	
	public int getReviewStar5(ReviewVO vo);
	
	public int getReviewStar4(ReviewVO vo);
	
	public int getReviewStar3(ReviewVO vo);
	
	public int getReviewStar2(ReviewVO vo);
	
	public int getReviewStar1(ReviewVO vo);
	
	public int getReviewStarCnt(ReviewVO vo);

	public int getReviewYN(ReviewVO vo);
	
}
