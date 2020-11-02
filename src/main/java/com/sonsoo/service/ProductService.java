package com.sonsoo.service;

import java.util.List;

import com.sonsoo.domain.CartVO;
import com.sonsoo.domain.MemberVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.domain.OrderedProductVO;
import com.sonsoo.domain.ProductVO;
import com.sonsoo.paging.ProductCriteria;


public interface ProductService {
	
	//상품 목록 조회
	public List<ProductVO> getProductList(ProductCriteria cri);	
	//상품 전체 건수 조회
	public int getTotal(ProductCriteria cri);
	//상품 카테고리 목록
	public List<String> getCategoryList();
	
	//상품 상세보기
	public ProductVO getProduct(String p_id);
	//좋아요
	public int updateLikeCount(String p_id);

	//상품 등록
	public void registerProduct(ProductVO vo);	
	//상품 수정
	public boolean modifyProduct(ProductVO vo);	
	//상품 삭제
	public boolean deleteProduct(String p_id);
	
	//판매자 목록
	public List<MemberVO> getSellerList(ProductCriteria cri);
	//판매자 상품 목록
	public List<ProductVO> getSellerProductList(String id);
	
	//장바구니 추가
	public void addCart(CartVO vo);
	//장바구니 목록
	public List<CartVO> cartList(String id);	
	//장바구니 수량 변경
	public int changeCart(int seq);
	//장바구니 삭제
	public void deleteCart(int seq);
	//재고 변경
	public int changeStock(OrderedProductVO vo);
	//
	public int refundStock(OrderVO vo);
}
