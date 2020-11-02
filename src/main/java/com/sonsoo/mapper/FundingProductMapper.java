package com.sonsoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sonsoo.domain.FundingCategoryVO;
import com.sonsoo.domain.FundingOrderVO;
import com.sonsoo.domain.FundingProductVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.paging.FundingCriteria;



public interface FundingProductMapper {
	//FP=funding product
	//상품추가
	public void insertFP(FundingProductVO vo);
	//상품 목록
	public List<FundingProductVO> getFPList();
	public List<FundingProductVO> getListWithPaging(FundingCriteria cri);
	//상품 얻기
	public FundingProductVO getFP(String fp_id);
	public int updateFP(FundingProductVO vo);
	public int deleteFP(String fp_id);
	
	//목록의 전체 갯수 얻기(마감안된 것)
	public int getTotalCount(FundingCriteria cri);
	//관리자용 목록(마감된것 포함)
	public int getTotalCountAdmin(FundingCriteria cri);
	
	public List<FundingCategoryVO> getCategoryList();
	
	//내가 주최한 상품 리스트
	public List<FundingProductVO> getMyProducts(String seller);
	
	//관리자용 모든 상품들
	public List<FundingProductVO> getAllProductsWithPaging(FundingCriteria cri);
	
	//펀딩 구매시 구매자가 구매한 갯수 받아와서 업뎃
	public int updateQty(@Param("fp_id") String fp_id,@Param("qty") int qty);
	//내가 구매한 펀딩목록
	public List<FundingOrderVO> myFundingOrderList(String id);
	//구매한 펀딩 삭제
	public int deleteFromOrders(String o_number);
	public int deleteFromOrderedProduct(String o_number);
	
}
