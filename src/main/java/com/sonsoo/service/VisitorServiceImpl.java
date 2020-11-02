package com.sonsoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.VisitorVO;
import com.sonsoo.mapper.VisitorMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class VisitorServiceImpl implements VisitorService{
	
	private VisitorMapper vm;
	
	@Override
	public List<VisitorVO> memberSList() {
		
		return vm.memberSList();
	}

	@Override
	public List<VisitorVO> memberCList() {
		
		return vm.memberCList();
	}

	@Override
	public VisitorVO memberInformation(VisitorVO vo) {
		
		return vm.memberInformation(vo);
	}

	@Override
	public VisitorVO memberTotalCost(VisitorVO vo) {
		
		return vm.memberTotalCost(vo);
	}

	@Override
	public VisitorVO memberTotalVisit(VisitorVO vo) {
		
		return vm.memberTotalVisit(vo);
	}

	@Override
	public VisitorVO memberCouponCnt(VisitorVO vo) {
		
		return vm.memberCouponCnt(vo);
	}

	@Override
	public VisitorVO memberVisit(VisitorVO vo) {
		
		return vm.memberVisit(vo);
	}

	@Override
	public VisitorVO memberOrderAndShipping(VisitorVO vo) {
		
		return vm.memberOrderAndShipping(vo);
	}

	@Override
	public VisitorVO memberMonthVisit(VisitorVO vo) {
		
		return vm.memberMonthVisit(vo);
	}

	@Override
	public VisitorVO memberMonthTotalCost(VisitorVO vo) {
		
		return vm.memberMonthTotalCost(vo);
	}

}
