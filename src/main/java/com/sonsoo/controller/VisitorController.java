package com.sonsoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sonsoo.domain.VisitorVO;
import com.sonsoo.service.VisitorService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/visitor/*")
@AllArgsConstructor
public class VisitorController {
	
	private VisitorService service;
	
	@RequestMapping("/adminMember")
	public void memberList(Model model) {
		
		model.addAttribute("mSList", service.memberSList());
		model.addAttribute("mCList", service.memberCList());
		
		log.info(model);
		
	}
	
	@GetMapping("/memberChartDetail")
	public void memberChartDetail(Model model, VisitorVO vo) {
		
		model.addAttribute("memberInformation",service.memberInformation(vo));
		model.addAttribute("memberTotalCost",service.memberTotalCost(vo));
		model.addAttribute("memberTotalVisit",service.memberTotalVisit(vo));
		model.addAttribute("memberCouponCnt",service.memberCouponCnt(vo));
		model.addAttribute("memberVisit",service.memberVisit(vo));
		model.addAttribute("memberOrderAndShipping",service.memberOrderAndShipping(vo));
		model.addAttribute("memberMonthVisit", service.memberMonthVisit(vo));
		model.addAttribute("memberMonthTotalCost", service.memberMonthTotalCost(vo));
		
		log.info(vo);
		log.info(model);
		
		
	}

}
