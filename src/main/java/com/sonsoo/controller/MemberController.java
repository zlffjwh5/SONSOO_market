package com.sonsoo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sonsoo.domain.MemberVO;
import com.sonsoo.domain.ProductVO;
import com.sonsoo.paging.ReviewCriteria;
import com.sonsoo.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MemberController {

	private MemberService service;
	
	// 로그인페이지
	@GetMapping("/login")
	public String getLogin() {

		return "/member/login";

	}

	// 로그인하기
	// 회원정보, 상품정보, 세션, 리뷰등록정보를 매개변수로 함.
	@PostMapping("/loginPost")
	public String getMember(MemberVO mvo, ProductVO pvo, HttpSession session, ReviewCriteria cri) {

		System.out.println("아이디 : " + mvo.getId());
		System.out.println("비밀번호 : " + mvo.getPassword());
		System.out.println("P_Id : " + pvo.getP_id());
		System.out.println("페이지번호 : " + cri.getPageNum());
		System.out.println("어마운트 : " + cri.getAmount());

		MemberVO member = service.getMember(mvo);

		if (member != null) {

			service.insertVisitDate(mvo);
			session.setAttribute("memberId", member.getId());
			System.out.println("memberId : " + member.getId());

			// return "redirect:/review/product?id=" + mvo.getId() + "&p_id=" +
			// pvo.getP_id() + "&pageNum=" + cri.getPageNum();
			return "/home";

		} else {

			return "/member/login";

		}

	}

	// 로그아웃하기
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/home");
		return mv;
	}

	// 회원가입페이지
	@GetMapping("/join")
	public void join() {

		// return "/member/join";

	}

	// 아이디체크
	@GetMapping("/idcheckAjax")
	public @ResponseBody String idcheckAjax(MemberVO vo) {
		log.info(vo);
		if (service.getMemberChk(vo) != null) {
			if (vo.getId().equals(service.getMemberChk(vo).getId())) {
				log.info(service.getMemberChk(vo));
				return "exists";
			} else {
				return "noExists";
			}
		} else {
			return "noExists";
		}
	}

	// 회원가입폼에서 값을 입력후 컨트롤러로 넘어온 파라미터를 받아서 db에 저장후 redirect로 home으로 이동.
	@PostMapping("/join")
	public String join(MemberVO vo) {

		service.join(vo);

		return "redirect:/home";
	}

	// 회원정보수정페이지
	@GetMapping("/myinfo")
	public String myinfo(MemberVO vo, Model model, ProductVO pvo, HttpSession session, ReviewCriteria cri) {

		// service.myinfo(service.join(vo));
		System.out.println("아이디는 : " + vo.getId());

		log.info("회원정보" + service.myinfo(vo));
		model.addAttribute("member", service.myinfo(vo));

		System.out.println("model : " + model);

		return "/member/myinfo";
	}

	// 회원정보수정하기
	@PostMapping("/mupdate")
	public String mupdate(MemberVO vo, Model model) {
		log.info("mupdate의 MemberVO :"+vo);
		log.info("?????"+vo.getPassword().isEmpty());
		
		
		System.out.println("model>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + model);
	// TODO 비밀번호 null처리 필요!!!
	//	if (vo.getPassword() == null || vo.getPassword().equals("")) {
	//		// TODO log.info("회원정보" + service.myinfo(vo));
	//		 vo.setPassword(vo.getPassword()); 
	//	}
			
		    service.mupdate(vo);
		
		return "redirect:/home";
	}

	/*
	 * //회원정보수정페이지
	 * 
	 * @GetMapping("/mupdate") public String mupdate() {
	 * 
	 * return "/mypage/mupdate";
	 * 
	 * }
	 */

	/*
	 * //회원정보수정페이지
	 * 
	 * @PostMapping("/myinfo") public String myinfo(HttpSession session) {
	 * 
	 * service.myinfo(session); return "member/myinfo";
	 * 
	 * }
	 */
	@GetMapping("/mdelete")
	public String mdelete(MemberVO vo, HttpSession session) {
		log.info(vo);
		service.mdelete(vo);
		session.invalidate();
        log.info(vo);		
		
		return "redirect:/home";
		
	}

}
