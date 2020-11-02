package com.sonsoo.mapper;

import com.sonsoo.domain.ChartVO;

public interface ChartMapper {

	public ChartVO memberMonthChart();
	
	public ChartVO productMonthChart();
	
	public ChartVO fundingMonthChart();
	
	public ChartVO orderMonthTotalCost();
	
	public ChartVO totalCost();
	
	public ChartVO totalMember();
	
	public ChartVO totalProducts();
	
}
