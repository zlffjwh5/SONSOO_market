package com.sonsoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sonsoo.domain.MessageVO;
import com.sonsoo.paging.MessageCriteria;

public interface MessageMapper {

	public List<MessageVO> getreadMessageListWithPaging(@Param("cri") MessageCriteria cri, @Param("reader") String reader);

	public List<MessageVO> getsendMessageListWithPaging(@Param("cri") MessageCriteria cri, @Param("sender") String sender);
	
	public int insertreadMessage(MessageVO vo);
	
	public int insertsendMessage(MessageVO vo);
	
	public int deleteReadMessage(int msg_seq);
	
	public int deletesendMessage(int msg_seq);
	
	public MessageVO getreadMessage(int msg_seq);
	
	public MessageVO getsendMessage(int msg_seq);
	
	public int getReadMsgCntBySeq(String reader);
	
	public int getSendMsgCntBySeq(String sender);
	
	public int readMsgCheck(MessageVO MsgCheck);
	
	public int notReadMsgCount(String reader);
	
	public List<MessageVO> unreadMsg3Cnt(@Param("reader") String reader);
	
	public int memberCheck(String reader);
	
}
