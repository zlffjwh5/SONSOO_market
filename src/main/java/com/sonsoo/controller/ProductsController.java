package com.sonsoo.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sonsoo.domain.CartVO;
import com.sonsoo.domain.MemberVO;
import com.sonsoo.domain.ProductVO;
import com.sonsoo.domain.ReviewVO;
import com.sonsoo.paging.ProductCriteria;
import com.sonsoo.paging.ProductPageDTO;
import com.sonsoo.paging.ReviewCriteria;
import com.sonsoo.paging.ReviewPagingDTO;
import com.sonsoo.service.ProductService;
import com.sonsoo.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/products/*")
@AllArgsConstructor
public class ProductsController {
	
	private ProductService service;
	private ReviewService reviewService;
	
	//상품 목록
	@GetMapping("/productList")// productList.jsp로 이동 /WEB-INF/views/products/productList.jsp
	public void productList(@ModelAttribute("cri") ProductCriteria cri, Model model, HttpSession session) {
		log.info("/productList:"+cri);
		//service의 getList()메소드 호출 결과를 model에 저장.		
		model.addAttribute("list", service.getProductList(cri));
		
		//페이지번호, 페이지당 건수로 조회
		int total = service.getTotal(cri);
		log.info("total:"+total);
		
		log.info("pageDTO:");		
		
		session.removeAttribute("review");
		System.out.println("중복등록 세션 삭제");
		
		model.addAttribute("pageMaker", new ProductPageDTO(cri, total));
		model.addAttribute("cri", cri);
	}	
	//판매자 상품 목록
	@GetMapping("/productListSeller")
	public void productListSeller(@RequestParam("id") String id, Model model) {
		log.info("/productSellerList:"+id);
		model.addAttribute("seller", id);
		model.addAttribute("listSeller", service.getSellerProductList(id));		
	}	
	
	
	
	//상품 상세
	@GetMapping("/product")// /products/get
	public String product(@RequestParam("p_id") String p_id, ReviewVO vo, ReviewCriteria cri, Model model) {
		log.info("/product:"+p_id);		
		model.addAttribute("product", service.getProduct(p_id));
		
		//리뷰
		System.out.println(vo.getP_id());
		System.out.println(cri.getPageNum());
		System.out.println(cri.getAmount());
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		vo.setPageNum(pageNum);
		vo.setAmount(amount);
		System.out.println(vo.getPageNum());
		System.out.println(vo.getAmount());
		
		System.out.println("해당 상품의 리뷰 갯수 : " + reviewService.getReviewStarCnt(vo));
		
		System.out.println("페이징1");
		model.addAttribute("review", reviewService.getReviewListWithPaging(vo));
		System.out.println("페이징2");
		model.addAttribute("pageMaker", new ReviewPagingDTO(cri, reviewService.getReviewStarCnt(vo)));
		System.out.println("페이징3");
		model.addAttribute("starAvg", reviewService.getReviewStarAvg(vo));
		model.addAttribute("star5", reviewService.getReviewStar5(vo));
		model.addAttribute("star4", reviewService.getReviewStar4(vo));
		model.addAttribute("star3", reviewService.getReviewStar3(vo));
		model.addAttribute("star2", reviewService.getReviewStar2(vo));
		model.addAttribute("star1", reviewService.getReviewStar1(vo));
		model.addAttribute("starCnt", reviewService.getReviewStarCnt(vo));
		model.addAttribute("reviewYN", reviewService.getReviewYN(vo));
		System.out.println("페이징4");
		
		return "/products/product";
		
	}
	//좋아요
    @RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH}, value="/good/{bno}" )
    public ResponseEntity<ProductVO> good(@PathVariable("p_id") String p_id){
    	log.info(p_id);    	
    	service.updateLikeCount(p_id);
 		return new ResponseEntity<ProductVO>(service.getProduct(p_id),HttpStatus.OK);
    }
    
    
    
	//카트보기
    @GetMapping("/cart")
    public void cart(@RequestParam("id") String id, Model model) {
		log.info("/cart:"+id);
		model.addAttribute("cartList", service.cartList(id));				
    }
    //카트추가
	@PostMapping("/cartPost")
	public String cartPost(@RequestParam("id") String id, @RequestParam("p_id") String p_id, @RequestParam("quantity") int quantity, Model model) {
		CartVO vo = new CartVO();
		vo.setId(id);
		vo.setP_id(p_id);
		vo.setQuantity(quantity);
		log.info("/cartPost:"+vo);
		service.addCart(vo);		
		return "redirect:/products/cart?id="+id;		
	}	
	//카트삭제
	@GetMapping("/cartDelete")
	public String cartDelete(@RequestParam("seq") int seq, @RequestParam("id") String id) {
		log.info("/cartDelete"+seq);
		service.deleteCart(seq);
		return "redirect:/products/cart?id="+id;
	}
	
	
	
	//상품 관리
	@GetMapping("/productManagement")
	public void productManagement(ProductCriteria cri, Model model) {
		log.info("/productManagement:"+cri);
		
		//service의 getList()메소드 호출 결과를 model에 저장.		
		model.addAttribute("list", service.getProductList(cri));
		
		//페이지번호, 페이지당 건수로 조회
		int total = service.getTotal(cri);
		log.info("total:"+total);
		
		log.info("pageDTO:");		
		model.addAttribute("pageMaker", new ProductPageDTO(cri, total));
	}	
	//상품등록
	@GetMapping("/productRegister")
	public void productRegister(Model model) {
		model.addAttribute("categoryList", service.getCategoryList());
	}
	//등록폼에서 값을 입력후 컨트롤러로 넘어온 파라미터를 받아서 db에 저장 후 redirect로 이동
	@PostMapping("/productRegister")
	public String productRegister(ProductVO vo, MultipartFile uploadFile, RedirectAttributes rttr) {
		log.info("productRegister:"+vo);
		log.info(uploadFile.getOriginalFilename());
		
		//이미지파일 처리(동일 이름으로 등록되지 않게)
		String uploadFolder ="C:\\uploadImages";
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
		vo.setTnImage(uploadFileName);
		
		service.registerProduct(vo);
		rttr.addFlashAttribute("result",vo.getP_id());			
		return "redirect:/products/productListSeller?id="+vo.getId();
	}
	//상품삭제
	@GetMapping("/productDelete")
	public String productDelete(@RequestParam("id") String id, @RequestParam("p_id") String p_id, RedirectAttributes rttr) {
		log.info("/productDelete:"+p_id); 
		
		if(service.deleteProduct(p_id)) 
			rttr.addFlashAttribute("result","successDelete");
		else
			System.out.println("실패");
		return "redirect:/products/productListSeller?id="+id;
	}	
	//상품수정
	@GetMapping("/productModify")
	public void productModify(@RequestParam String p_id, Model model) {
		model.addAttribute("categoryList", service.getCategoryList());
		model.addAttribute("product", service.getProduct(p_id));
	}
	@PostMapping("/productModify")
	public String productModify(ProductVO vo, MultipartFile uploadFile, RedirectAttributes rttr) {
		log.info(vo.getP_id());
		
		log.info(uploadFile.getOriginalFilename());
		
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
			vo.setTnImage(uploadFileName);
		}
		if(service.modifyProduct(vo)) {
			rttr.addFlashAttribute("result","successModify");
		}
		log.info("modifyFP: "+vo);
		return "redirect:/products/productListSeller?id="+vo.getId();
	}
	
	
	
	
	
	
	
	
	
	
	//리뷰
	@PostMapping("/addReviewPost")
	public String insertReview(ReviewVO vo, MemberVO mvo, ProductVO pvo, HttpSession session) throws IOException {
		
		System.out.println("여기 실행됨1");
		
		System.out.println("상품번호  : " + pvo.getP_id());
		System.out.println("별점 : " + vo.getStar());
		System.out.println("제목 : " + vo.getTitle());
		System.out.println("내용 : " + vo.getContent());
		System.out.println("아이디 : " + vo.getId());
		System.out.println("파일명 : " + vo.getUploadFile());
		System.out.println("순수파일명 : " + vo.getImageName());
		
		MultipartFile uploadFile = vo.getUploadFile();		
		
		
		System.out.println("여기 실행됨2");
		
		if(!uploadFile.isEmpty()) {
			
			System.out.println("여기 실행됨3");
			
			long now = new java.util.Date().getTime();
			
			String fileName = uploadFile.getOriginalFilename().substring(0,uploadFile.getOriginalFilename().indexOf("."));
			String ext = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().indexOf("."));
			
			vo.setImageName(fileName + now + ext);
			
			System.out.println("파일명 : " + fileName);
			System.out.println("확장자명 : " + ext);
			System.out.println("밀리초 : " + now);
			
			uploadFile.transferTo(new File("C:/uploadImages/" + fileName + now + ext));
			vo.setImages(fileName);
			
		}
		
		if(session.getAttribute("review") == null) {
			
			System.out.println("여기 실행됨4");
			
			session.setAttribute("review", vo);
			reviewService.insertReview(vo);
			return "redirect:/products/product?id=" + mvo.getId() + "&p_id=" + pvo.getP_id();
			
		} else {
			
			return "redirect:/products/product?id=" + mvo.getId() + "&p_id=" + pvo.getP_id();
			
		}
		
	}	
	
	@GetMapping("/detailsReview")
	public void getReview(ReviewVO vo, Model model) {
		
		model.addAttribute("Dreview", reviewService.getReview(vo));
		// 댓글리스트 여기 추가

		System.out.println(model);
		
	}
	
	@GetMapping("/deleteReview")
	public String deleteReview(ReviewVO vo, MemberVO mvo, ProductVO pvo, HttpSession session) {
		
		reviewService.deleteReview(vo);
		System.out.println(vo.getRno());
		System.out.println(vo.getId());
		System.out.println(vo.getP_id());
		
		mvo.setId(vo.getId());
		pvo.setP_id(vo.getP_id());
		
		session.removeAttribute("review");
		
		return "redirect:/products/product?id=" + mvo.getId() + "&p_id=" + pvo.getP_id();
		
	}
	
	@GetMapping("/updateReview")
	public void updateReview(ReviewVO vo, Model model) {
		
		System.out.println("ggggggggg");
		
		model.addAttribute("Ureview", reviewService.getReview(vo));
		
	}	
	
	
	@PostMapping("/updateReviewPost")
	public String updateReviewPost(ReviewVO vo) throws Exception{
		System.out.println("업데이트 리뷰 여기 실행됨");
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			
			System.out.println("여기 실행됨3");
			
			long now = new java.util.Date().getTime();
			
			String fileName = uploadFile.getOriginalFilename().substring(0,uploadFile.getOriginalFilename().indexOf("."));
			String ext = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().indexOf("."));
			
			vo.setImageName(fileName + now + ext);
			
			System.out.println("파일명 : " + fileName);
			System.out.println("확장자명 : " + ext);
			System.out.println("밀리초 : " + now);
			
			uploadFile.transferTo(new File("C:/uploadImages/" + fileName + now + ext));
			vo.setImages(fileName);
			
		}
		
		
		reviewService.updateReview(vo);
		
		return "redirect:/products/detailsReview?rno=" + vo.getRno();
		
	}
}
