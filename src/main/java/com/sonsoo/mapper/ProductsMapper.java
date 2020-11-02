package com.sonsoo.mapper;

import java.util.List;

import com.sonsoo.domain.CartVO;
import com.sonsoo.domain.MemberVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.domain.OrderedProductVO;
import com.sonsoo.domain.ProductVO;
import com.sonsoo.paging.ProductCriteria;

public interface ProductsMapper {

	//상품 목록
	public List<ProductVO> getProductList(ProductCriteria cri);
	//상품 전체 목록 조회 건수
	public int getTotalCount(ProductCriteria cri);
	
	//상품 카테고리 목록
	public List<String> getCategoryList();
		
	//상품 상세
	public ProductVO getProduct(String p_id);
	//조회 건수 증가
	public void updateReadCount(String p_id);
	//좋아요
	public int updateLikeCount(String p_id);
	
	//상품 등록
	public void registerProduct(ProductVO vo);	
	//상품 삭제
	public int deleteProduct(String p_id);	
	//상품 수정
	public int modifyProduct(ProductVO vo);
	
	//판매자 목록
	public List<MemberVO> getSellerList(ProductCriteria cri);
	//판매자 상품 목록
	public List<ProductVO> getSellerProductList(String id);
	
	//장바구니 목록
	public List<CartVO> cartList(String id);
	//장바구니 추가
	public void addCart(CartVO vo);
	//장바구니 수량변경
	public int changeCart(int seq);
	//장바구니 하나삭제
	public void deleteCart(int seq);
	//장바구니 전체삭제
	public void deleteCarts(String id);
	//재고 변경
	public int changeStock(OrderedProductVO vo);
	//재고 환불
	public int refundStock(OrderVO vo);
	
}
