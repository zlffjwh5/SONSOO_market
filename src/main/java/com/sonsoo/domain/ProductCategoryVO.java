package com.sonsoo.domain;

import lombok.Data;

@Data
public class ProductCategoryVO {
	private Long seq;//카테고리 번호
	private String c_name;//카테고리 이름 - 유니크
	private String description;//카테고리 설명
}
