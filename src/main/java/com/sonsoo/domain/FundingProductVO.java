package com.sonsoo.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FundingProductVO {
	private String fp_id;
	private String fp_name;
	private String fp_category;
	private String fp_image;
	private String fp_description;
	private String fp_seller;
	private int fp_price;
	private int goal_cost;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deadline;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date payDate;
	private int funding_qty;
	private int fp_state; //펀딩상태 0.진행중  1.펀딩종료(목표금액 달성) 2.펀딩완료(목표금액 실패)

	private List<FundingCategoryVO> categoryList;
}
