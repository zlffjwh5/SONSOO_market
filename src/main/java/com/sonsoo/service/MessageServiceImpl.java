package com.sonsoo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.sonsoo.domain.MessageVO;
import com.sonsoo.mapper.MessageMapper;
import com.sonsoo.paging.MessageCriteria;
import com.sonsoo.paging.MessagePagingDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MessageServiceImpl implements MessageService{

	private MessageMapper mapper;
	
	@Override
	public List<MessageVO> getreadMessageListWithPaging(@Param("cri") MessageCriteria cri, @Param("reader") String reader) {
		
		return mapper.getreadMessageListWithPaging(cri, reader);
	}
	
	@Override
	public List<MessageVO> getsendMessageListWithPaging(@Param("cri") MessageCriteria cri, @Param("sender") String sender) {
		
		return mapper.getsendMessageListWithPaging(cri, sender);
	}

	@Override
	public int insertreadMessage(MessageVO vo) {
		
		return mapper.insertreadMessage(vo);
		
	}
	
	@Override
	public int insertsendMessage(MessageVO vo) {
		
		return mapper.insertsendMessage(vo);
		
	}

	@Override
	public MessageVO getreadMessage(int msg_seq) {
		
		return mapper.getreadMessage(msg_seq);
	}
	
	@Override
	public MessageVO getsendMessage(int msg_seq) {
		
		return mapper.getsendMessage(msg_seq);
	}

	@Override
	public int deleteReadMessage(int msg_seq) {
		
		return mapper.deleteReadMessage(msg_seq);
	}

	@Override
	public int deletesendMessage(int msg_seq) {
		
		return mapper.deletesendMessage(msg_seq);
	}

	@Override
	public MessagePagingDTO getReadMsgListPage(MessageCriteria cri, @Param("reader") String reader) {
		
		return new MessagePagingDTO(mapper.getReadMsgCntBySeq(reader), 0, mapper.getreadMessageListWithPaging(cri, reader));
	}

	@Override
	public MessagePagingDTO getSendMsgListPage(MessageCriteria cri,@Param("sender") String sender) {
		
		return new MessagePagingDTO(0, mapper.getSendMsgCntBySeq(sender),  mapper.getsendMessageListWithPaging(cri, sender));
	}

	@Override
	public int readMsgCheck(MessageVO vo) {
		
		return mapper.readMsgCheck(vo);
		
	}

	@Override
	public int notReadMsgCount(String reader) {
		
		return mapper.notReadMsgCount(reader);
	}

	@Override
	public List<MessageVO> unreadMsg3Cnt(String reader) {
		
		log.info("unreadMsg3Cnt Reader : " + reader);
		
		return mapper.unreadMsg3Cnt(reader);
	}

	@Override
	public int memberCheck(String reader) {
		
		return mapper.memberCheck(reader);
	}

}
