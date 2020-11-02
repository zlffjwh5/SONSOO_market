package com.sonsoo.paging;

import java.util.List;

import com.sonsoo.domain.MessageVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MessagePagingDTO { 
	
	
	private int readMsgCnt;
	private int sendMsgCnt;
	private List<MessageVO> list; 

}
