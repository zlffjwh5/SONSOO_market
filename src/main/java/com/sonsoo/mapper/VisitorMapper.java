package com.sonsoo.mapper;

import java.util.List;

import com.sonsoo.domain.VisitorVO;

public interface VisitorMapper {

	public List<VisitorVO> memberSList();
	
	public List<VisitorVO> memberCList();
	
	public VisitorVO memberInformation(VisitorVO vo);
	
	public VisitorVO memberTotalCost(VisitorVO vo);
	
	public VisitorVO memberTotalVisit(VisitorVO vo);
	
	public VisitorVO memberCouponCnt(VisitorVO vo);
	
	public VisitorVO memberVisit(VisitorVO vo);
	
	public VisitorVO memberOrderAndShipping(VisitorVO vo);
	
	public VisitorVO memberMonthVisit(VisitorVO vo);
	
	public VisitorVO memberMonthTotalCost(VisitorVO vo);
	
}
