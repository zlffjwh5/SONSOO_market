package com.sonsoo.domain;

import lombok.Data;

@Data
public class CardPayVO {
	
	private String o_number;
	private String cardNumber;
	private String expDate;
	private String securityCode;

}
