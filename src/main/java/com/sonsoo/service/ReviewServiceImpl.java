package com.sonsoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.ReviewVO;
import com.sonsoo.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{

	private ReviewMapper rm;

	//@Override
	//public List<ReviewVO> getReviewList(ReviewVO vo) {
		
	//	return rm.getReviewList(vo);
	//}
	
	@Override
	public List<ReviewVO> getReviewListWithPaging(ReviewVO vo) {
		
		return rm.getReviewListWithPaging(vo);
	}
	
	
	@Override
	public String getReviewStarAvg(ReviewVO vo) {
		
		return rm.getReviewStarAvg(vo);
	}

	@Override
	public int getReviewStar5(ReviewVO vo) {
		
		return rm.getReviewStar5(vo);
	}

	@Override
	public int getReviewStar4(ReviewVO vo) {
		
		return rm.getReviewStar4(vo);
	}

	@Override
	public int getReviewStar3(ReviewVO vo) {
		
		return rm.getReviewStar3(vo);
	}

	@Override
	public int getReviewStar2(ReviewVO vo) {
		
		return rm.getReviewStar2(vo);
	}

	@Override
	public int getReviewStar1(ReviewVO vo) {
		
		return rm.getReviewStar1(vo);
	}

	@Override
	public int getReviewStarCnt(ReviewVO vo) {
		
		return rm.getReviewStarCnt(vo);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		
		rm.insertReview(vo);
		
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		
		return rm.getReview(vo);
		
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		
		rm.deleteReview(vo);
		
	}

	@Override
	public void updateReview(ReviewVO vo) {
		
		rm.updateReview(vo);
		
	}

	@Override
	public int getReviewYN(ReviewVO vo) {
		
		return rm.getReviewYN(vo);
	}

}
