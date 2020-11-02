package com.sonsoo.service;

import java.util.List;

import com.sonsoo.domain.FundingCategoryVO;
import com.sonsoo.domain.FundingOrderVO;
import com.sonsoo.domain.FundingProductVO;
import com.sonsoo.paging.FundingCriteria;

public interface FundingProductService {
	//상품 추가
	public void addProduct(FundingProductVO vo);
	//현재
	public List<FundingProductVO> getProducts(FundingCriteria cri);
	//상품 상세
	public FundingProductVO getProduct(String fp_id);
	//수정
	public boolean modifyProduct(FundingProductVO vo);
	//삭제
	public boolean deleteProduct(String fp_id);
	//전체 갯수 얻기(일반 사용자 페이징용)
	public int getTotal(FundingCriteria cri);
	//전체 개수 얻기(관리자 페이징용)
	public int getTotalAdmin(FundingCriteria cri);
	//카테고리 리스트 얻는용
	public List<FundingCategoryVO> getCategoryList();
	//내가 주최한 상품들
	public List<FundingProductVO> getMyProducts(String seller);
	//관리자용 모든 상품들
	public List<FundingProductVO> getAllProducts(FundingCriteria cri);
	
	/*결제 예약시 예약된 갯수 업뎃*/
	public boolean updateQty(String fp_id,int qty);
	
	//내가 예약한 펀딩 물품 목록
	public List<FundingOrderVO> myFundingOrderList(String id);
	public boolean deleteFundingOrder(String o_number);
}
