package com.sonsoo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewCommentsVO {

	private int rcno;
	private int rno;
	private String id;
	private String content;
	private Date regDate;
	
}
