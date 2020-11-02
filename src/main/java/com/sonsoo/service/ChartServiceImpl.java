package com.sonsoo.service;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.ChartVO;
import com.sonsoo.mapper.ChartMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ChartServiceImpl implements ChartService{

	ChartMapper mapper;
	
	@Override
	public ChartVO memberMonthChart() {
		System.out.println("여기실행");
		return mapper.memberMonthChart();
	}

	@Override
	public ChartVO productMonthChart() {
		
		return mapper.productMonthChart();
	}

	@Override
	public ChartVO fundingMonthChart() {
		
		return mapper.fundingMonthChart();
	}

	@Override
	public ChartVO orderMonthTotalCost() {
		
		return mapper.orderMonthTotalCost();
	}

	@Override
	public ChartVO totalCost() {
		
		return mapper.totalCost();
	}

	@Override
	public ChartVO totalMember() {
		
		return mapper.totalMember();
	}

	@Override
	public ChartVO totalProducts() {
		
		return mapper.totalProducts();
	}
	
	

}
