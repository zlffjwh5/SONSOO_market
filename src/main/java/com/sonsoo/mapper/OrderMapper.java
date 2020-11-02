package com.sonsoo.mapper;

import java.util.List;
import java.util.Map;

import com.sonsoo.domain.CardPayVO;
import com.sonsoo.domain.CouponVO;
import com.sonsoo.domain.MemberVO;
import com.sonsoo.domain.OrderVO;
import com.sonsoo.domain.OrderedProductVO;
import com.sonsoo.domain.ProductVO;

public interface OrderMapper {
	
	public void insertOrder(OrderVO vo);
	public void insertOrderedProduct(OrderedProductVO opvo);
	public void insertCardPay(CardPayVO vo);
	public void updateStatus(Map<String, String> map);
	
	public MemberVO getMember(String id);

	public List<CouponVO> getCoupon(String id);
	
	public ProductVO getProduct(String p_id);
	
	public OrderVO getVO(String o_number);
	public OrderedProductVO getPVO(String o_number);
	public List<OrderedProductVO> getPVOList(String o_number);
	
	public void removeCartList(Map<String, String> map);
	
	

}
