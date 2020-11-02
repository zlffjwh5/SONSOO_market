package com.sonsoo.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class FundingOrderVO {
	private String o_number; //주문번호
	private String p_id; //상품 ID
	private String p_name;
	private int qty; //구매 수량
	@DateTimeFormat
	private Date o_date; //날짜
	private String status; //예약상태(ex확정)
	private String tnimage;
	private int totalcost; //총금액
}
