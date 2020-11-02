package com.sonsoo.controller;




import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sonsoo.domain.ChartVO;
import com.sonsoo.service.ChartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/chart/*")
@RestController
@Log4j
@AllArgsConstructor
public class ChartController {
	
	private ChartService service;
	
	@GetMapping(value = "/ct/mMchart",
				produces = {MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ChartVO memberMonthChart() {
		
		log.info("2020년도 월별 회원가입자 수 : " + service.memberMonthChart());
		
		return service.memberMonthChart();
		
	}
	
	@GetMapping(value = "/ct/pMchart",
				produces = {MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ChartVO productMonthChart() {
		
		log.info("2020년도 월별 일반상품 주문건 수 : " + service.productMonthChart());
		
		return service.productMonthChart();
		
	}
	
	@GetMapping(value = "/ct/fMchart",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ChartVO fundingMonthChart() {
		
		log.info("2020년도 월별 펀딩상품 주문건 수 : " + service.fundingMonthChart());
		
		return service.fundingMonthChart();
		
	}
	
	@GetMapping(value = "/ct/otMchart",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ChartVO orderMonthTotalCost() {
		
		log.info("2020년도 월별 매출액 :" + service.orderMonthTotalCost());
		
		return service.orderMonthTotalCost();
		
	}
	
	@GetMapping(value = "/ct/tcMchart",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ChartVO totalCost() {
		
		log.info("총 누적 판매액 : " + service.totalCost());
		
		return service.totalCost();
		
	}
	
	@GetMapping(value = "/ct/tMchart",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ChartVO totalMember() {
		
		log.info("총 누적 회원수 : " + service.totalMember());
		
		return service.totalMember();
		
	}
	
	@GetMapping(value = "/ct/pftMchart",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ChartVO totalProducts() {
		
		log.info("펀딩상품 & 일반상품갯수 : " + service.totalMember());
		
		return service.totalProducts();
		
	}


}
