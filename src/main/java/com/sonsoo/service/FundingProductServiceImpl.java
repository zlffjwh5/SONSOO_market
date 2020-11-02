package com.sonsoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonsoo.domain.FundingCategoryVO;
import com.sonsoo.domain.FundingOrderVO;
import com.sonsoo.domain.FundingProductVO;
import com.sonsoo.mapper.FundingProductMapper;
import com.sonsoo.paging.FundingCriteria;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class FundingProductServiceImpl implements FundingProductService{
	
	@Setter (onMethod_=@Autowired)
	private FundingProductMapper mapper;
	
	@Override
	public void addProduct(FundingProductVO vo) {
		mapper.insertFP(vo);
	}

	@Override
	public List<FundingProductVO> getProducts(FundingCriteria cri) {
		
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int getTotal(FundingCriteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public FundingProductVO getProduct(String fp_id) {
		return mapper.getFP(fp_id);
	}

	@Override
	public boolean modifyProduct(FundingProductVO vo) {
		return mapper.updateFP(vo)==1;
	}

	@Override
	public boolean deleteProduct(String fp_id) {
		return mapper.deleteFP(fp_id)==1;
	}
	@Override
	public List<FundingCategoryVO> getCategoryList(){
		return mapper.getCategoryList();
	}
	/*==================주최자용=================*/
	@Override
	public List<FundingProductVO> getMyProducts(String seller){
		return mapper.getMyProducts(seller);
	}
	
	/*==================관리자용=================*/
	@Override
	public List<FundingProductVO> getAllProducts(FundingCriteria cri) {
		return mapper.getAllProductsWithPaging(cri);
	}

	@Override
	public int getTotalAdmin(FundingCriteria cri) {
		return mapper.getTotalCountAdmin(cri);
	}
	/*결제 예약시 예약된 갯수 업뎃 qty는 구매자가 구매한 물량(영수증에 써있는거)*/
	@Override
	public boolean updateQty(String fp_id, int qty) {
		return mapper.updateQty(fp_id, qty)==1;
	}
	/*내가 예약한 펀딩 목록*/
	@Override
	public List<FundingOrderVO> myFundingOrderList(String id) {

		return mapper.myFundingOrderList(id);
	}

	@Override
	public boolean deleteFundingOrder(String o_number) {
		return mapper.deleteFromOrders(o_number)==1&&
		mapper.deleteFromOrderedProduct(o_number)==1;
	}

}
