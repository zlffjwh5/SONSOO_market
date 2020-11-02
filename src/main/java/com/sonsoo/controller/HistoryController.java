package com.sonsoo.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sonsoo.domain.OrderVO;
import com.sonsoo.domain.RefundListVO;
import com.sonsoo.paging.HistoryCriteria;
import com.sonsoo.paging.HistoryPagingDTO;
import com.sonsoo.service.HistoryService;
import com.sonsoo.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/history/*")
public class HistoryController {

	@Setter(onMethod_ = @Autowired)
	private HistoryService service;
	private ProductService pservice;

	// 구매내역
	@GetMapping("/buyList")
	public void buyList(HistoryCriteria cri, Model model, HttpSession session, OrderVO ovo) {
		
		String id = (String)session.getAttribute("memberId");
		
		log.info(id);
		
		log.info("buyList: " + cri);
		
		model.addAttribute("buyList", service.getBuyListWithPaging(cri,id));

		int total = service.getTotal(cri,id);
		
		log.info("total: " + total);

		model.addAttribute("pageMaker", new HistoryPagingDTO(cri, total));

	}

	// 배송정보조회
	@GetMapping("/shippingList")
	public void shippingList(HistoryCriteria cri, Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("memberId");
		
		log.info(id);
		
		log.info("shippingList: " + cri);
		
		model.addAttribute("shippingList", service.getShippingListWithPaging(cri,id));

		int total = service.getTotalCountShipping(cri,id);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new HistoryPagingDTO(cri, total));

	}

	// 환불 내역 조회
	@GetMapping("/refundList") // url-> /history/buyList
	public void getrefundList(HistoryCriteria cri, Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("memberId");
		
		log.info(id);
		
		log.info("refundList: " + cri);
		
		model.addAttribute("refundList", service.getRefundListWithPaging(cri,id));

		int total = service.getTotalCountRefund(cri,id);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new HistoryPagingDTO(cri, total));

	}

	// 주문 취소 페이지처리
	@GetMapping("/cancelApplication") // url-> /history/buyList
	public void cancelApp(OrderVO ovo, Model model, HistoryCriteria cri, RedirectAttributes rttr) {
		log.info("OrderVO : " + ovo);
		
		ovo = service.getProduct(ovo);
		
		log.info("selected : " + ovo);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		
		log.info("cancelApplication : =====>" + cri);
		
		model.addAttribute("buyProduct", ovo);
		
		pservice.refundStock(ovo);

	}

	// 구매취소 상품 입력
	@PostMapping("/cancel")
	public String insertCancelData(OrderVO ovo, RefundListVO rvo, @RequestParam HashMap<String, String> paramMap, 
													HistoryCriteria cri, RedirectAttributes rttr) {
		
		String p_id = paramMap.get("p_id");
		String refundMeans = paramMap.get("refundMeans");
		log.info("P_ID" + p_id);
		
		log.info("Primary Key" + ovo.getO_number());
		
		ovo = service.getProduct(ovo);

		log.info("selected : " + ovo);
	
		rvo.setO_number(ovo.getO_number());
		rvo.setP_id(p_id);
		rvo.setId(ovo.getId());
		rvo.setQty(ovo.getQty());
		rvo.setPrice(ovo.getPrice());
		rvo.setRefundMeans(refundMeans);
		rvo.setPostcode(ovo.getPostcode());
		rvo.setAddress(ovo.getAddress() +" "+ ovo.getDetailAddress() +" "+  ovo.getExtraAddress());
		rvo.setName(ovo.getName());
		rvo.setPhone(ovo.getPhone());
		rvo.setTotalCost(ovo.getTotalCost());
		
		log.info(refundMeans);
		
		service.insertCancelOrder(rvo);
		
		service.updateCancelStatus(ovo);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		
		log.info("cancelApplication : =====>" + cri);
		
		log.info("UPDATE STATUS : =====>" + ovo);
		
		return "redirect:buyList";
	}

	//환불상품페이지
	@GetMapping("/refundApplication") // url-> /history/buyList
	public void refundApp(Model model, OrderVO ovo) {
		log.info(ovo);
		ovo = service.getProduct(ovo);
		log.info("selected : " + ovo);
		model.addAttribute("buyProduct", ovo);
		pservice.refundStock(ovo);

	}
	
	//환불상품 정보 입력
	@PostMapping("/refund")
	public String insertRefundData(OrderVO ovo, RefundListVO rvo, @RequestParam HashMap<String, String> paramMap) {
		
		service.updateRefundStatus(ovo);
		
		String p_id = paramMap.get("p_id");
		String rm = paramMap.get("refundMeans");
		String rs = paramMap.get("refundSystem");
		
		log.info("P_ID : " + p_id);
		log.info("PRIMARY KEY : " + ovo.getO_number());

		ovo = service.getProduct(ovo);

		log.info("selected : " + ovo);
	
		rvo.setO_number(ovo.getO_number());
		rvo.setP_id(ovo.getP_id());
		rvo.setId(ovo.getId());
		rvo.setQty(ovo.getQty());
		rvo.setPrice(ovo.getPrice());
		rvo.setRefundMeans(rm);
		rvo.setRefundSystem(rs);
		rvo.setPostcode(ovo.getPostcode());
		rvo.setAddress(ovo.getAddress() +" "+ ovo.getDetailAddress() +" "+  ovo.getExtraAddress());
		rvo.setName(ovo.getName());
		rvo.setPhone(ovo.getPhone());
		rvo.setTotalCost(ovo.getTotalCost());
		
		log.info(rm);
		
		log.info(rvo);
		
		service.insertRefundOrder(rvo);
		
		return "redirect:refundList";
	}
	
	//구매확정
	@PostMapping("/confirmation")
	public String confirmation(OrderVO ovo, HistoryCriteria cri, RedirectAttributes rttr, @RequestParam HashMap<String, String> paramMap) {
		
		String p_id = paramMap.get("p_id");
		String o_number = paramMap.get("o_number");
		
		log.info("Primary Key :" + o_number);
		log.info("BUYLIST P_ID ===========>" + p_id);
		
		ovo = service.getProduct(ovo);
		
		service.updateConfirmation(ovo);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		
		return "redirect:buyList";
	}
	

	@GetMapping("/checkShipping") // url-> /history/buyList
	public void checkShipping(HistoryCriteria cri, Model model) {

	}

	@GetMapping("/clause") // url-> /history/buyList
	public void clause(HistoryCriteria cri, Model model) {

	}

	//관리자 배송정보 변경 페이지
	@GetMapping("/AdminShippingSet") // url-> /history/buyList
	public void AdminShippingSet(HistoryCriteria cri, Model model) {

		log.info("SaleList: " + cri);
		model.addAttribute("ShippingStatus", service.getSaleListWithPaging(cri));

		int total = service.getTotalCountSale(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new HistoryPagingDTO(cri, total));
		
	}
	
	//관리자 배송정보 변경
	@PostMapping("/changeShippingStatus") // url-> /history/buyList
	public String changeShippingStatus(OrderVO ovo, @RequestParam HashMap<String,String> paramMap) {
		String p_id = paramMap.get("p_id");
		String status = paramMap.get("status");
		String o_number = paramMap.get("o_number");
		
		log.info("STATUS : "+status);
		log.info("PRIMARY KEY : "+o_number);
		log.info("P_ID : "+p_id);
		
		ovo = service.getProduct(ovo);
		
		log.info("GET ovo : "+ovo);
		
		ovo.setStatus(status);
		
		log.info("CHANGE STATUS : "+ovo);
		
		service.updateStatus(ovo);
		
		log.info("UPDATE STATUS : "+ovo);
		
		return "redirect:AdminShippingSet";
	}

	@GetMapping("/AdminRefundSet") // url-> /history/buyList
	public void AdminRefundSet(HistoryCriteria cri, Model model) {
		
		
		log.info("WaitingList: " + cri);
		
		model.addAttribute("RefundStatus", service.getWaitingListWithPaging(cri));

		int total = service.getTotalCountWaiting(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new HistoryPagingDTO(cri, total));
	}

	@PostMapping("/changeRefundStatus") // url-> /history/buyList
	public String changeRefundStatus(OrderVO ovo, RefundListVO rvo, @RequestParam HashMap<String,String> paramMap) {
		String p_id = paramMap.get("p_id");
		String status = paramMap.get("status");
		String o_number = paramMap.get("o_number");
		
		log.info("P_ID : "+ p_id);
		log.info("STATUS : "+status);
		log.info("PRIMARY KEY : "+o_number);
		
		ovo = service.getProduct(ovo);
		
		log.info("GET SaleTABLE : "+ovo);
		
		rvo = service.getWaitingProduct(rvo);
		
		log.info("GET RefundTABLE : "+rvo);
		
		ovo.setStatus(status);
		
		log.info("CHANGE STATUS : "+ovo);
		
		//업데이트 STATUS
		service.updateStatus(ovo);
		
		//환불 수락 날짜 입력
		//SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		
		Date currentTime = new Date();
		
		rvo.setRefundDate(currentTime);
		
		service.updateRefundAccept(rvo);
		
		return "redirect:AdminRefundSet";
	}
}
