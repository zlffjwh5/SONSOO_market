package com.sonsoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sonsoo.domain.RefundListVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.paging.HistoryCriteria;

public interface HistoryMapper {

	//구매 내역
	public List<OrderVO> getBuyListWithPaging(@Param("cri") HistoryCriteria cri, @Param("id") String id);
	
	//배송 내역
	public List<OrderVO> getShippingListWithPaging(@Param("cri") HistoryCriteria cri, @Param("id") String id);
	
	//환불 내역
	public List<OrderVO> getRefundListWithPaging(@Param("cri") HistoryCriteria cri, @Param("id") String id);
	
	//배송관리 내역(관리자)
	public List<OrderVO> getSaleListWithPaging(HistoryCriteria cri);
	
	//환불신청 페이지 관리 (관리자)
	public List<RefundListVO> getWaitingListWithPaging(HistoryCriteria cri);
	
	//Total 페이지
	public int getTotalCount(@Param("cri") HistoryCriteria cri, @Param("id") String id);
	public int getTotalCountShipping(@Param("cri") HistoryCriteria cri, @Param("id") String id);
	public int getTotalCountRefund(@Param("cri") HistoryCriteria cri, @Param("id") String id);
	
	//Total 관리자 페이지
	public int getTotalCountSale(HistoryCriteria cri);
	public int getTotalCountWaiting(HistoryCriteria cri);

	//Sale 테이블 SEQ이용해서 가져오기
	public OrderVO getProduct(OrderVO vo);

	//RefundListEX 테이블 SEQ로 불러오기
	public RefundListVO getWaitingProduct(RefundListVO rvo);
	
	//구매취소 신청
	public int insertCancelOrder(RefundListVO rvo);
	public int updateCancelStatus(OrderVO ovo);
	
	//반품신청
	public int insertRefundOrder(RefundListVO rvo);
	public int updateRefundStatus(OrderVO ovo);

	//구매확정
	public int updateConfirmation(OrderVO ovo);

	//구매자 STATUS 변경 (관리자)
	public int updateStatus(OrderVO ovo);

	//환불 수락 날짜 업데이트(관리자)
	public int updateRefundAccept(RefundListVO rvo);




	


	



	
	


}
