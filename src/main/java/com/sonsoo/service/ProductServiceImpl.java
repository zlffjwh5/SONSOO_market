package com.sonsoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.CartVO;
import com.sonsoo.domain.MemberVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.domain.OrderedProductVO;
import com.sonsoo.domain.ProductVO;
import com.sonsoo.mapper.ProductsMapper;
import com.sonsoo.paging.ProductCriteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	private ProductsMapper mapper;
	
	
	//상품 목록
	@Override
	public List<ProductVO> getProductList(ProductCriteria cri) {
		log.info("<<상품 목록>>");
		return mapper.getProductList(cri);
	}
	//상품 전체 목록 조회 건수
	@Override
	public int getTotal(ProductCriteria cri) {
		log.info("<<상품 전체 건수>>");
		return mapper.getTotalCount(cri);
	}	
	//상품 카테고리 목록
	@Override
	public List<String> getCategoryList() {
		log.info("<<상품 카테고리 목록>>");
		return mapper.getCategoryList();
	}

	
	//상품 상세
	@Override
	public ProductVO getProduct(String p_id) {
		log.info("<<상품 상세:"+p_id+">>");
		mapper.updateReadCount(p_id);//조회수증가
		return mapper.getProduct(p_id);
	}
	//상품 좋아요
	@Override
	public int updateLikeCount(String p_id) {
		log.info("<<좋아요 증가:"+p_id+">>");
		return mapper.updateLikeCount(p_id);
	}

	
	//상품 등록
	@Override
	public void registerProduct(ProductVO vo) {
		log.info("<<상품 등록:"+vo+">>");	
		mapper.registerProduct(vo);
	}
	//상품 수정
	@Override
	public boolean modifyProduct(ProductVO vo) {
		log.info("<<상품 수정:"+vo+">>");	
		return mapper.modifyProduct(vo)==1;
	}
	//상품 삭제
	@Override
	public boolean deleteProduct(String p_id) {
		log.info("<<상품 삭제:"+p_id+">>");		
		return mapper.deleteProduct(p_id)==1;
	}

	
	//판매자 목록
	@Override
	public List<MemberVO> getSellerList(ProductCriteria cri) {
		log.info("<<판매자 목록>>");
		return mapper.getSellerList(cri);
	}
	//판매자 상품 목록
	@Override
	public List<ProductVO> getSellerProductList(String id) {
		log.info("<<판매자 상품 목록>>");
		return mapper.getSellerProductList(id);
	}
	
	
	//장바구니
	@Override
	public void addCart(CartVO vo) {
		log.info("<<장바구니 추가>>");
		mapper.addCart(vo);
	}
	@Override
	public List<CartVO> cartList(String id) {
		log.info("<<장바구니 목록>>");
		return mapper.cartList(id);
	}
	@Override
	public int changeCart(int seq) {
		log.info("<<장바구니 수량변경>>");
		return mapper.changeCart(seq);
	}
	@Override
	public void deleteCart(int seq) {
		log.info("<<장바구니 하나삭제>>");
		mapper.deleteCart(seq);
	}
	
	@Override
	public int changeStock(OrderedProductVO vo) {
		log.info("<<상품 수량 변경:"+vo+">>");
		return mapper.changeStock(vo);
	}
	@Override
	public int refundStock(OrderVO vo) {
		// TODO Auto-generated method stub
		return mapper.refundStock(vo);
	}
	

}
