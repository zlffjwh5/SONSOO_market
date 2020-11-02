package com.sonsoo.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sonsoo.domain.FundingProductVO;
import com.sonsoo.paging.FundingCriteria;
import com.sonsoo.paging.FundingPageDTO;
import com.sonsoo.service.FundingProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/funding/*")
public class FundingController {

	@Setter(onMethod_=@Autowired)
	private FundingProductService service;
	
	//펀딩상품 목록(구매자 시점)
	@GetMapping("FProducts") 
	public String fundingProducts(@ModelAttribute("cri") FundingCriteria cri, Model model) {
		model.addAttribute("fpList", service.getProducts(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new FundingPageDTO(cri, total));
		//System.out.println("넘어온 카테고리++++++++++++++++"+cri.getType());
		//System.out.println("넘어온 키워드++++++++++++++++"+cri.getKeyword());
		model.addAttribute("categoryList",service.getCategoryList());
		return "/funding/fd_products";
	}
	//펀딩상품 개별 상세
	@GetMapping("FProduct") 
	public String fundingProduct(@RequestParam String fp_id, Model model,@ModelAttribute("cri") FundingCriteria cri) {
		model.addAttribute("fp", service.getProduct(fp_id));
		return "/funding/fd_product_detail";
	}

	//펀딩상품 등록 페이지
	@GetMapping("addFP") 
	public String addFundingProduct(Model model) {
		model.addAttribute("categoryList",service.getCategoryList());
		return "/funding/add_funding_product";
	}
	//펀딩상품 등록
	@PostMapping("addFP") 
	public String addFundingProduct(FundingProductVO vo,MultipartFile uploadFile,RedirectAttributes rttr) {
		log.info("addFProduct>>>>>>>>>>> "+vo.toString());
		log.info(uploadFile.getOriginalFilename());
		//이미지파일 처리(동일 이름으로 등록되지 않게
		String uploadFolder ="C:\\uploadImages\\funding";
		String uploadFileName= uploadFile.getOriginalFilename();
		uploadFileName=uploadFileName.substring(uploadFileName.indexOf("\\")+1);
		log.info("uploadfilename:"+uploadFileName);
		UUID uuid = UUID.randomUUID();
		
		uploadFileName = uuid.toString()+"_"+uploadFileName;

		File saveFile = new File(uploadFolder, uploadFileName);
		try {
			uploadFile.transferTo(saveFile);
		}catch (Exception e) {
			log.info(e.getMessage());
		}
		
		vo.setFp_image(uploadFileName);
		
		service.addProduct(vo);
		log.info("++++++++++++++++++++++++++++++++"+vo.getFp_id());
		rttr.addFlashAttribute("result",vo.getFp_id());
		return "redirect:/funding/mypageSeller";
		
	}
	//펀딩 상품 수정 페이지
	@GetMapping("modifyFP") 
	public String modifyFundingProduct(@RequestParam String fp_id,Model model/*@ModelAttribute("cri") FundingCriteria cri*/) {
		model.addAttribute("categoryList",service.getCategoryList());
		model.addAttribute("fp", service.getProduct(fp_id));
		return "/funding/modify_funding_product";
	}
	//펀딩상품 수정
	@PostMapping("modifyFP") 
	public String modifyFundingProduct(FundingProductVO vo, MultipartFile uploadFile,
				RedirectAttributes rttr,HttpSession session) {
		log.info("modifyFP: "+vo);
		log.info("여기확인--+++"+uploadFile.getOriginalFilename());
		//이미지파일 처리(동일 이름으로 등록되지 않게
		String uploadFolder ="C:\\uploadImages";
		String uploadFileName= uploadFile.getOriginalFilename();
		if(uploadFileName!=null&&uploadFileName!="") {
			uploadFileName=uploadFileName.substring(uploadFileName.indexOf("\\")+1);
			log.info("uploadfilename:"+uploadFileName);
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString()+"_"+uploadFileName;
	
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				uploadFile.transferTo(saveFile);
			}catch (Exception e) {
				log.info(e.getMessage());
			}
			vo.setFp_image(uploadFileName);
		}
		if(service.modifyProduct(vo)) {
			rttr.addFlashAttribute("result","successModify");
		}
		//rttr.addAttribute("pageNum",cri.getPageNum());
		//rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/funding/mypageSeller";
	}
	//상품 삭제
	@GetMapping("deleteFP")
	public String removeFundingProduct(@RequestParam String fp_id, RedirectAttributes rttr) {
		log.info("delete:"+fp_id);
		if(service.deleteProduct(fp_id)) 
			rttr.addFlashAttribute("result","successDelete");
		return "redirect:/funding/mypageSeller";
	}
	/*==============구매자 시점================*/
	//펀딩 예약 목록
	@GetMapping("orderFPList")
	public String orderList(HttpSession session,Model model) {
		String loginId = (String) session.getAttribute("memberId");
		//log.info(service.myFundingOrderList(loginId));
		model.addAttribute("fpOrderList",service.myFundingOrderList(loginId));
		return "/funding/orderList";
	}
	//예약 취소
	@PostMapping("deleteOrder")
	public String deleteOrder(@RequestParam String fp_id,@RequestParam int orderQty,@RequestParam String o_number) {
		log.info("취소 넘어 온 것:"+fp_id+" "+o_number+" "+orderQty);
		//전체 펀딩 받은 갯수 수정
		service.updateQty(fp_id,-orderQty);
		//주문 테이블, 주문된 상품 테이블에서 지우기
		service.deleteFundingOrder(o_number);
		return "redirect:/funding/orderFPList";
	}
	/*==============주최자 시점================*/
	//펀딩상품 목록(주최자 시점)
	@GetMapping("mypageSeller") 
	public String myfundingProducts(Model model,HttpSession session) {
		String loginId =(String) session.getAttribute("memberId");
		model.addAttribute("fpList", service.getMyProducts(loginId));
		return "/funding/myPage_seller";
	}
	//펀딩상품 개별 상세(주최자 시점)
	@GetMapping("myProduct") 
	public String myfundingProduct(@RequestParam String fp_id, Model model) {
		model.addAttribute("fp", service.getProduct(fp_id));
		return "/funding/my_fd_product_detail";
	}
	/*==============관리자 시점================*/
	@GetMapping("adminFPList") 
	public void myfundingProducts(@ModelAttribute("cri") FundingCriteria cri,Model model) {
		int total = service.getTotalAdmin(cri);
		System.out.println("넘어온 ++++++++++++++++type+++++"+cri.getType());
		System.out.println("넘어온 ++++++++++++++++keyword+++++"+cri.getKeyword());
		model.addAttribute("pageMaker",new FundingPageDTO(cri, total));
		model.addAttribute("fpList", service.getAllProducts(cri));
	}
	//수정
	@GetMapping("adminModifyFP") 
	public String adminModifyFundingProduct(@RequestParam String fp_id,Model model) {
		model.addAttribute("categoryList",service.getCategoryList());
		model.addAttribute("fp", service.getProduct(fp_id));
		return "/funding/admin_modify_product";
	}
	@PostMapping("adminModifyFP") 
	public String adminModifyFundingProduct(FundingProductVO vo, MultipartFile uploadFile,
				RedirectAttributes rttr,HttpSession session) {
		log.info("modifyFP: "+vo);
		log.info("여기확인--+++"+uploadFile.getOriginalFilename());
		//이미지파일 처리(동일 이름으로 등록되지 않게
		String uploadFolder ="C:\\uploadImages";
		String uploadFileName= uploadFile.getOriginalFilename();
		if(uploadFileName!=null&&uploadFileName!="") {
			uploadFileName=uploadFileName.substring(uploadFileName.indexOf("\\")+1);
			log.info("uploadfilename:"+uploadFileName);
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString()+"_"+uploadFileName;
	
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				uploadFile.transferTo(saveFile);
			}catch (Exception e) {
				log.info(e.getMessage());
			}
			vo.setFp_image(uploadFileName);
		}
		if(service.modifyProduct(vo)) {
			rttr.addFlashAttribute("result","successModify");
		}
		//rttr.addAttribute("pageNum",cri.getPageNum());
		//rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/funding/adminFPList";
	}
	//상품 삭제
		@GetMapping("adminDeleteFP")
		public String adminRemoveFundingProduct(@RequestParam String fp_id, RedirectAttributes rttr) {
			log.info("delete:"+fp_id);
			if(service.deleteProduct(fp_id)) 
				rttr.addFlashAttribute("result","successDelete");
			return "redirect:/funding/adminFPList";
		}
	

}
