package com.sonsoo.domain;

import lombok.Data;

@Data
public class OrderedProductVO {
	private String o_number;
	private String p_id;
	private String p_name;
	private int price;
	private int qty;
	private String tnImage;
	private String status;
}
