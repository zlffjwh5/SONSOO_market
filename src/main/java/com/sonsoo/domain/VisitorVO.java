package com.sonsoo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class VisitorVO {

	private String id;
	private String name;
	private String phone;
	private String postcode;
	private String address;
	private String detailaddress;
	private int totalCost;
	private int visit;
	private Date reg_Date;
	
	private int memberTotalCost;
	private int memberTotalVisit;
	
	private int coupon;
	private Date visit_Date;
	
	private int status1;
	private int status2;
	private int status3;
	private int status4;
	private int status5;
	private int status6;
	private int status7;
	private int status8;
	
	private int mvisit1;
	private int mvisit2;
	private int mvisit3;
	private int mvisit4;
	private int mvisit5;
	private int mvisit6;
	private int mvisit7;
	private int mvisit8;
	private int mvisit9;
	private int mvisit10;
	
	private int mtotal1;
	private int mtotal2;
	private int mtotal3;
	private int mtotal4;
	private int mtotal5;
	private int mtotal6;
	private int mtotal7;
	private int mtotal8;
	private int mtotal9;
	private int mtotal10;
	
	
	
}
