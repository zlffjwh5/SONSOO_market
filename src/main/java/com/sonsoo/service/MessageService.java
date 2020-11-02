package com.sonsoo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sonsoo.domain.MessageVO;
import com.sonsoo.paging.MessageCriteria;
import com.sonsoo.paging.MessagePagingDTO;

public interface MessageService {

	public List<MessageVO> getreadMessageListWithPaging(@Param("cri") MessageCriteria cri, @Param("reader") String reader);
	
	public List<MessageVO> getsendMessageListWithPaging(@Param("cri") MessageCriteria cri, @Param("sender") String sender);
	
	public int insertreadMessage(MessageVO vo);
	
	public int insertsendMessage(MessageVO vo);
	
	public int deleteReadMessage(int msg_seq);
	
	public int deletesendMessage(int msg_seq);
	
	public MessageVO getreadMessage(int msg_seq);
	
	public MessageVO getsendMessage(int msg_seq);
	
	public MessagePagingDTO getReadMsgListPage(MessageCriteria cri, @Param("reader") String reader);
	
	public MessagePagingDTO getSendMsgListPage(MessageCriteria cri, @Param("sender") String sender);
	
	public int readMsgCheck(MessageVO vo);
	
	public int notReadMsgCount(String reader);
	
	public List<MessageVO> unreadMsg3Cnt(String reader);
	
	public int memberCheck(String reader);
	
}
