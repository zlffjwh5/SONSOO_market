package com.sonsoo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	 private Long bno;
	 private String title;
	 private String summary;
	 private String content;
	 private Date regDate;
	 private Long cnt;
	 private String thumbnail;
	 
}
