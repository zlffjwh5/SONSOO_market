package com.sonsoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sonsoo.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class MenuController {
	
	private ProductService service;
	
	//상품분류
	@GetMapping("*")
	public void productCategory(Model model) {
		model.addAttribute("categoryList", service.getCategoryList());
	}

}
