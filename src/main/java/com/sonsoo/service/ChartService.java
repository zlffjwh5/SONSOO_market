package com.sonsoo.service;

import com.sonsoo.domain.ChartVO;

public interface ChartService {

	public ChartVO memberMonthChart();
	
	public ChartVO productMonthChart();
	
	public ChartVO fundingMonthChart();
	
	public ChartVO orderMonthTotalCost();
	
	public ChartVO totalCost();
	
	public ChartVO totalMember();
	
	public ChartVO totalProducts();
	
}
