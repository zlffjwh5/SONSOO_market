package com.sonsoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.RefundListVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.mapper.HistoryMapper;
import com.sonsoo.paging.HistoryCriteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class HistoryServiceImpl implements HistoryService {
	
	private HistoryMapper hm;

	@Override
	public List<OrderVO> getBuyListWithPaging(HistoryCriteria cri, String id) {
	
		return 	hm.getBuyListWithPaging(cri,id);
	}

	@Override
	public List<OrderVO> getShippingListWithPaging(HistoryCriteria cri, String id) {
		return hm.getShippingListWithPaging(cri,id);
	}
	
	@Override
	public List<OrderVO> getRefundListWithPaging(HistoryCriteria cri, String id) {
		return hm.getRefundListWithPaging(cri,id);
	}
	
	//관리자 배송수정 페이지
	@Override
	public List<OrderVO> getSaleListWithPaging(HistoryCriteria cri) {
		return hm.getSaleListWithPaging(cri);
	}
	
	//환불신청 페이지 관리 (관리자)
	@Override
	public List<RefundListVO> getWaitingListWithPaging(HistoryCriteria cri) {
		return hm.getWaitingListWithPaging(cri);
	}
	
	@Override
	public int getTotal(HistoryCriteria cri, String id) {
		return hm.getTotalCount(cri,id);
	}
	
	@Override
	public int getTotalCountShipping(HistoryCriteria cri, String id) {
		return hm.getTotalCountShipping(cri,id);
	}
	
	@Override
	public int getTotalCountRefund(HistoryCriteria cri, String id) {
		return hm.getTotalCountRefund(cri,id);
	}

	@Override
	public OrderVO getProduct(OrderVO vo) {
		return hm.getProduct(vo);
	}

	@Override
	public int insertCancelOrder(RefundListVO rvo) {
		return hm.insertCancelOrder(rvo);
	}

	@Override
	public int insertRefundOrder(RefundListVO rvo) {
		return hm.insertRefundOrder(rvo);
	}

	@Override
	public int updateCancelStatus(OrderVO ovo) {
		return hm.updateCancelStatus(ovo);
	}

	@Override
	public int updateRefundStatus(OrderVO ovo) {
		return hm.updateRefundStatus(ovo);
	}

	@Override
	public int updateConfirmation(OrderVO ovo) {
		return hm.updateConfirmation(ovo);
	}

	@Override
	public int getTotalCountSale(HistoryCriteria cri) {
		return hm.getTotalCountSale(cri);
	}

	@Override
	public int updateStatus(OrderVO ovo) {
		return hm.updateStatus(ovo);
	}

	@Override
	public int getTotalCountWaiting(HistoryCriteria cri) {
		return hm.getTotalCountWaiting(cri);
	}

	@Override
	public RefundListVO getWaitingProduct(RefundListVO rvo) {
		return hm.getWaitingProduct(rvo);
	}

	//환불 수락 날짜 업데이트
	@Override
	public int updateRefundAccept(RefundListVO rvo) {
		return hm.updateRefundAccept(rvo);
	}

}
	
