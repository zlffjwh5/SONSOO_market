package com.sonsoo.service;

import java.util.List;

import com.sonsoo.domain.OrderVO;
import com.sonsoo.domain.RefundListVO;
import com.sonsoo.paging.HistoryCriteria;

public interface HistoryService {
	//구매내역
	public List<OrderVO> getBuyListWithPaging(HistoryCriteria cri, String id);
	
	//배송내역
	public List<OrderVO> getShippingListWithPaging(HistoryCriteria cri, String id);
	
	//환불내역
	public List<OrderVO> getRefundListWithPaging(HistoryCriteria cri, String id);
	
	//배송관리내역 (관리자)
	public List<OrderVO> getSaleListWithPaging(HistoryCriteria cri);
	
	//환불신청 페이지 관리 (관리자)
	public List<RefundListVO> getWaitingListWithPaging(HistoryCriteria cri);
	
	//구매내역 목록 통계
	public int getTotal(HistoryCriteria cri, String id);
	
	//배송내역 목록 통계
	public int getTotalCountShipping(HistoryCriteria cri, String id);
	
	//환불내역 목록 통계
	public int getTotalCountRefund(HistoryCriteria cri, String id);
	
	//판매내역 목록 통계(관리자)
	public int getTotalCountSale(HistoryCriteria cri);
	
	//환불신청내역 목록 통계 (관리자)
	public int getTotalCountWaiting(HistoryCriteria cri);
	
	//구매한 상품 정보 불러오기
	public OrderVO getProduct(OrderVO vo);

	//취소 신청 상품 등록
	public int insertCancelOrder(RefundListVO rvo);
	public int updateCancelStatus(OrderVO svo);
	
	//반품신청 상품 등록
	public int insertRefundOrder(RefundListVO rvo);
	public int updateRefundStatus(OrderVO svo);
	
	//구매확정 처리
	public int updateConfirmation(OrderVO svo);

	//구매자 STATUS 변경 (관리자)
	public int updateStatus(OrderVO svo);

	//환불신청된 상품 정보 불러오기 (관리자)
	public RefundListVO getWaitingProduct(RefundListVO rvo);

	//환불 수락 날짜 업데이트
	public int updateRefundAccept(RefundListVO rvo);



}
