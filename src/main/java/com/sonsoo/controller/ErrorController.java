package com.sonsoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/error/*")
public class ErrorController {
	
	@GetMapping("/errorPage")
	public String errPage() {
		return "error/errorPage";
	}
}