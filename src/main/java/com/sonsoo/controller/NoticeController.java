package com.sonsoo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sonsoo.domain.NoticeVO;
import com.sonsoo.paging.NoticeCriteria;
import com.sonsoo.paging.NoticePageDTO;
import com.sonsoo.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/notice/*")
@Log4j
public class NoticeController {
	
	private NoticeService service;
	
//공지사항 목록 페이지로 이동
	@RequestMapping("/list")
	public void list(@ModelAttribute NoticeCriteria cri,Model model,HttpSession session) {
		String id = (String)session.getAttribute("memberId");
		log.info("notice----------------"+cri);
		model.addAttribute("noticeList", service.getListWithPaging(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new NoticePageDTO(cri, total));
		model.addAttribute("cri",cri);
		model.addAttribute("id",id);
	}
	
//공지사항 작성 페이지로 이동
	@RequestMapping("/write")
	public void write(NoticeCriteria cri, Model model) {}

//글 작성하기
	@PostMapping("/insertNotice")
	public String insertNotice(NoticeVO vo) {
		service.insert(vo);
		return "redirect:/notice/list";
	}

//글 내용 보기
	@GetMapping("/get")
	public void get(@RequestParam Long bno,@ModelAttribute NoticeCriteria cri, Model model,HttpSession session) {
		String id = (String)session.getAttribute("memberId");
		model.addAttribute("notice", service.get(bno));
		model.addAttribute("cri",cri);
		model.addAttribute("id",id);
	}
	
//글 수정하기
	@GetMapping("/modify")
	public String modify(@RequestParam Long bno,@ModelAttribute NoticeCriteria cri, Model model) {
			log.info("bno.."+bno);
			log.info("service.get(bno)."+service.get(bno));
			model.addAttribute("notice", service.get(bno));
			model.addAttribute("cri",cri);
			return "/notice/modify";
	}

//글 수정 처리
	@PostMapping("/modifyNotice")
	public String modifyNotice(NoticeVO vo, @ModelAttribute NoticeCriteria cri, Model model) {
		model.addAttribute("notice", service.modify(vo));
		model.addAttribute("cri",cri);
		return "redirect:/notice/get?bno=" + vo.getBno();
	}

//글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam Long bno,@ModelAttribute NoticeCriteria cri, Model model) {
		model.addAttribute("notice", service.remove(bno));
		model.addAttribute("cri",cri);
		return "redirect:/notice/list";
	}
	
}
