package com.sonsoo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sonsoo.domain.CardPayVO;
import com.sonsoo.domain.CartVO;
import com.sonsoo.domain.CouponVO;
import com.sonsoo.domain.FundingProductVO;
import com.sonsoo.domain.KaKaoPayVO;
import com.sonsoo.domain.KakaoPayApprovalVO;
import com.sonsoo.domain.MemberVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.domain.OrderedProductVO;
import com.sonsoo.domain.ProductVO;
import com.sonsoo.service.FundingProductService;
import com.sonsoo.service.OrderService;
import com.sonsoo.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/order/*")
@Log4j
public class OrderController {
		
		private OrderService service;
		private FundingProductService fpservice;
		private ProductService pservice;
		
		@Setter(onMethod_ = @Autowired)
		private KaKaoPayVO kpVO; 
		
//일반 상품 주문 페이지로 이동
		@GetMapping("/orderView")
		public void orderView(Model model, HttpSession session){
			String id = (String)session.getAttribute("memberId");
			int sum = 0;
			List<CartVO> cartList = pservice.cartList(id);
			for(CartVO cvo : cartList) sum+=(cvo.getPrice()*cvo.getQuantity());
			model.addAttribute("cartList",cartList);
			model.addAttribute("sum",sum);
		}
//펀딩 예약 페이지로 이동
		@GetMapping("/orderFundingView")
		public void orderFundingView(){}

//주문번호 생성(주문 페이지 이동 시 실행)
		@RequestMapping("/orderNumber")
		public void orderNumber() {}

//회원 정보 찾기
		@GetMapping("/getMember")
		public @ResponseBody MemberVO getMember(@RequestParam String id, MemberVO vo) {
			vo = service.getMember(id);
			return vo;
		}

//회원 id로 쿠폰 목록 조회
		@GetMapping("/getCoupon")
		public @ResponseBody List<CouponVO> getCoupon(@RequestParam String id) { 
			List<CouponVO> list = (List<CouponVO>) service.getCoupon(id); 
			return list; 
		}

//상품 id로 정보 조회 - 일반
		@GetMapping("/getProduct")
		public @ResponseBody ProductVO getProduct(@RequestParam String p_id, ProductVO pvo) {
			pvo = service.getProduct(p_id);
			return pvo;
		}
		
//상품 id로 정보 조회 - 펀딩
		@GetMapping("/getFundingProduct")
		public @ResponseBody FundingProductVO getFundingProduct(@RequestParam String p_id, FundingProductVO fpvo) {
			fpvo = fpservice.getProduct(p_id);
			return fpvo;
		}
		
//카카오페이 결제		
		@RequestMapping("/kakaoPay") 
	    public @ResponseBody String kakaoPay(@RequestBody KaKaoPayVO vo) {
			return kpVO.kakaoPayReady(vo);
	    }
	    
	    @RequestMapping("/kakaoPaySuccess")
	    public @ResponseBody KakaoPayApprovalVO kakaoPaySuccess(@RequestParam String pg_token,KakaoPayApprovalVO approvalVO) {
	        approvalVO = kpVO.kakaoPayInfo(pg_token);
	        return approvalVO;
	    }

//카드 결제 요청 시 -- 일반
	    @PostMapping("/payProcess") 
		public ModelAndView cardPayProcess(@ModelAttribute OrderVO vo, @ModelAttribute OrderedProductVO opvo,Map<String, String> map) {
	    	
	    	service.insertOrder(vo);
	    	
	    	List<CartVO> cartList = new ArrayList<CartVO>();
	    	cartList = pservice.cartList(vo.getId());
	    	
	    	for(CartVO cvo:cartList) {
	    		opvo.setO_number(vo.getO_number());
	    		opvo.setP_id(cvo.getP_id());
	    		opvo.setP_name(cvo.getName());
	    		opvo.setPrice(cvo.getPrice());
	    		opvo.setQty(cvo.getQuantity());
	    		opvo.setTnImage(cvo.getTnImage());
	    		
	    		service.insertOrderedProduct(opvo);
	    		
	    		map = new HashMap<String, String>();
	    		map.put("p_id", cvo.getP_id());
	  			map.put("id", vo.getId());
	  			
	    		service.removeCartList(map);
	    	}
  			
			ModelAndView mav = new ModelAndView();
	        mav.addObject("vo",vo);
	        mav.addObject("o_number", vo.getO_number());
	        mav.setViewName("/order/cardPayProcess");
	        
	        return mav;
	    }

//카드 결제 완료 시  
	  	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	  	public ModelAndView insertOrder(@ModelAttribute OrderVO vo, @ModelAttribute OrderedProductVO opvo,
	  															@ModelAttribute CardPayVO cvo, Map<String, String> map) {
	  			map = new HashMap<String, String>();
	  			map.put("status", "1");
	  			map.put("o_number", cvo.getO_number());
	  			
	  			service.insertCardPay(cvo);
	  			service.updateStatus(map);
	  			
	  			ModelAndView mav = new ModelAndView();
		        mav.addObject("vo",vo);
		        mav.addObject("opvoList",service.getPVOList(cvo.getO_number()));
		        mav.addObject("opvo",null);
		        mav.addObject("cvo",cvo);
		        mav.setViewName("/order/orderConfirm");
		        
		        //재고처리...
		        List<OrderedProductVO> opvoList = service.getPVOList(cvo.getO_number());
		        for (OrderedProductVO opv : opvoList) {
					pservice.changeStock(opv);
				}
		        
	  			
		        return mav;
	  	}
	  	
//펀딩 예약 완료	시
	  	@PostMapping("/participate") 
		public ModelAndView participate(@ModelAttribute OrderVO vo, @ModelAttribute OrderedProductVO opvo, 
																@ModelAttribute CardPayVO cvo, Map<String, String> map) {
	  		    
	  			service.insertOrder(vo);
	  			service.insertOrderedProduct(opvo);
	  			
	  			map = new HashMap<String, String>();
	  			map.put("status", "예약확정");
	  			map.put("o_number", vo.getO_number());
  			
	  			service.updateStatus(map);
	  			/*==========펀딩 참여 현황 갯수 업뎃============*/
	  	
	  			fpservice.updateQty(opvo.getP_id(),opvo.getQty());
	  			/*==============여기까지 추가============*/
	  			
	  			ModelAndView mav = new ModelAndView();
	  			mav.addObject("vo",vo);
	  			mav.addObject("opvo",opvo);
	  			mav.addObject("opvoList",null);
	  			mav.addObject("cvo",cvo);
	  			mav.setViewName("/order/orderConfirm");
	  			return mav;
	    }
	  	
//영수증 페이지
	  	@RequestMapping("/orderConfirm")
	  	public void orderConfirm() {}

//
	  	@GetMapping("/findOrderVO")
	  		public @ResponseBody OrderVO findOrderVO(@RequestParam String o_number, OrderVO vo) {
	  			vo = service.getVO(o_number);
	  			log.info(vo);
	  			return vo;
	  	}
//
	  	@GetMapping("/findProductVO")
	  	public @ResponseBody OrderedProductVO findProductVO(@RequestParam String o_number, OrderedProductVO opvo) {
	  			opvo = service.getPVO(o_number);
	  			log.info(opvo);
	  			return opvo;
	  	}
	  	
	  	
	  	
	
}//class
