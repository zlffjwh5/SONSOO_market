package com.sonsoo.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {

	private int rno;
	private String id;
	private String p_id;
	private String title;
	private String content;
	private Date regDate;
	private MultipartFile uploadFile;
	private int star;
	
	private String images;
	private String imageName;
	
	
	// ReviewCriteria.java의 속성들을 MybatisMapper로 넘겨주지 못해서 해결하기위해 처리한 방법... 나중에 개선 가능하면 생각해보기
	private int pageNum;
	private int amount;
	
}
