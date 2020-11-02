package com.sonsoo.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String password;
	private String name;
//	private String product;
	private String phone;
	private String postcode;
	private String address;
	private String extraAddress;
	private String detailAddress;
	
}
