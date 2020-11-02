package com.sonsoo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {

	private int msg_seq;
	private String sender;
	private String reader;
	private String title;
	private String content;
	private Date regDate;
	private String MsgCheck;
	
	private int pageNum;
	private int amount;
	
}
