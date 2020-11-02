package com.sonsoo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonsoo.domain.FAQVO;
import com.sonsoo.paging.FAQCriteria;
import com.sonsoo.paging.FAQPageDTO;
import com.sonsoo.service.FAQService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/faq/*")
@Log4j
public class FAQController {
	
	private FAQService service;
	
//QnA 목록 페이지로 이동
	@RequestMapping("/list")
	public void list(@ModelAttribute FAQCriteria cri,Model model,HttpSession session) {
		String id = (String)session.getAttribute("memberId");
		log.info("faq----------------"+cri);
		model.addAttribute("faqList", service.getListWithPaging(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new FAQPageDTO(cri, total));
		model.addAttribute("cri",cri);
		model.addAttribute("id",id);
	}
	
//QnA 작성 페이지로 이동
	@RequestMapping("/write")
	public void write(FAQCriteria cri, Model model) {}

//글 작성하기
	@PostMapping("/insertFAQ")
	public String insertNotice(FAQVO vo) {
		service.insert(vo);
		return "redirect:/faq/list";
	}

//글 내용 보기
	@GetMapping("/get")
	public void get(@RequestParam Long bno,@ModelAttribute FAQCriteria cri, Model model,HttpSession session) {
		String id = (String)session.getAttribute("memberId");
		model.addAttribute("faq", service.get(bno));
		model.addAttribute("cri",cri);
		model.addAttribute("id",id);
	}
//글 수정하기
	@GetMapping("/modify")
	public String modify(@RequestParam Long bno,@ModelAttribute FAQCriteria cri, Model model) {
			log.info("faq bno.."+bno);
			log.info("faq service.get(bno)."+service.get(bno));
			model.addAttribute("faq", service.get(bno));
			model.addAttribute("cri",cri);
			return "/faq/modify";
	}

//글 수정 처리
	@PostMapping("/modifyFAQ")
	public String modifyNotice(FAQVO vo, @ModelAttribute FAQCriteria cri, Model model) {
		model.addAttribute("faq", service.modify(vo));
		model.addAttribute("cri",cri);
		return "redirect:/faq/get?bno=" + vo.getBno();
	}

//글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam Long bno,@ModelAttribute FAQCriteria cri, Model model) {
		model.addAttribute("faq", service.remove(bno));
		model.addAttribute("cri",cri);
		return "redirect:/faq/list";
	}
	
}
