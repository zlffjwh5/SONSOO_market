package com.sonsoo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sonsoo.domain.MemberVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.domain.OrderedProductVO;
import com.sonsoo.domain.ProductVO;
import com.sonsoo.mapper.OrderMapper;
import com.sonsoo.domain.CardPayVO;
import com.sonsoo.domain.CouponVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class OrderServiceImpl implements OrderService{
	
	private OrderMapper om;
	
	@Override
	public void insertOrder(OrderVO vo) {
			om.insertOrder(vo);
	}
	
	@Override
	public void insertOrderedProduct(OrderedProductVO opvo) {
			om.insertOrderedProduct(opvo);
	}
	
	@Override
	public void insertOrderedFundingProduct(OrderedProductVO opvo) {
			om.insertOrderedProduct(opvo);
	}
	
	@Override
	public void insertCardPay(CardPayVO vo) {
			om.insertCardPay(vo);
		
	}
	
	@Override
	public void updateStatus( Map<String, String> map) {
			om.updateStatus(map);
	}
	
	

	@Override
	public MemberVO getMember(String id) {
			return om.getMember(id);
	}

	@Override
	public List<CouponVO> getCoupon(String id) {
			return (List<CouponVO>) om.getCoupon(id);
	}

	@Override
	public ProductVO getProduct(String p_id) {
			log.info("------------------> getProduct ServiceImpl 문제 없음");
			return om.getProduct(p_id);
	}

	@Override
	public OrderVO getVO(String o_number) {
			log.info("------------------> getMember ServiceImpl 문제 없음");
			return om.getVO(o_number);
	}

	@Override
	public OrderedProductVO getPVO(String o_number) {
			log.info("------------------> getMember ServiceImpl 문제 없음");
			return om.getPVO(o_number);
	}

	@Override
	public List<OrderedProductVO> getPVOList(String o_number) {
			return om.getPVOList(o_number);
	}

	@Override
	public void removeCartList(Map<String, String> map) {
			om.removeCartList(map);
	}

	

}
