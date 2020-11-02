package com.sonsoo.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sonsoo.domain.MessageVO;
import com.sonsoo.paging.MessageCriteria;
import com.sonsoo.paging.MessagePagingDTO;
import com.sonsoo.service.MessageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/msg/*")
@RestController
@Log4j
@AllArgsConstructor
public class MessageController {

	private MessageService service;
	
	@PostMapping(value = "/newMsg",
				 consumes = "application/json",
				 produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertMsg(@RequestBody MessageVO vo){
		
		log.info("MessageVO : " + vo);
		
		int insertCnt = service.insertreadMessage(vo);
		int insertCnt2 = service.insertsendMessage(vo);
		
		log.info("Message Insert Count : " + insertCnt);
		
		return (insertCnt == 1 && insertCnt2 == 1)
				? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping(value = "/rp/{reader}/{page}",
				produces = {MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MessagePagingDTO> getreadMessageList(@PathVariable("reader") String reader, @PathVariable("page") int page){
		
		log.info("getreadMessageList.............");
		
		
		MessageCriteria cri = new MessageCriteria(page, 10);
		
		log.info(cri);
		
		return new ResponseEntity<>(service.getReadMsgListPage(cri, reader), HttpStatus.OK);
		
	}
	
	@GetMapping(value = "/sp/{sender}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MessagePagingDTO> getsendMessageList(@PathVariable("page") int page, @PathVariable("sender") String sender){
	
		log.info("getsendMessageList.............");
	
		
		MessageCriteria cri = new MessageCriteria(page, 10);
	
		log.info(cri);
	
		return new ResponseEntity<>(service.getSendMsgListPage(cri, sender), HttpStatus.OK);
	
	}
	
	@GetMapping(value = "/rp/{msg_seq}",
				produces = {MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MessageVO> getReadMessage(@PathVariable("msg_seq") int msg_seq){
		
		log.info("getRead : " + msg_seq);
		
		return new ResponseEntity<MessageVO>(service.getreadMessage(msg_seq), HttpStatus.OK);
		
	}
	
	@GetMapping(value = "/sp/{msg_seq}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MessageVO> getSeadMessage(@PathVariable("msg_seq") int msg_seq){
	
		log.info("getSend : " + msg_seq);
	
		return new ResponseEntity<MessageVO>(service.getsendMessage(msg_seq), HttpStatus.OK);
	
	}
	
	@DeleteMapping(value = "/rp/{msg_seq}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> readMessageDelete(@PathVariable("msg_seq") int msg_seq){
		
		log.info("ReadDelete : " + msg_seq);
		
		return service.deleteReadMessage(msg_seq) == 1
				? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@DeleteMapping(value = "/sp/{msg_seq}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> seadMessageDelete(@PathVariable("msg_seq") int msg_seq){
		
		log.info("ReadDelete : " + msg_seq);
		
		return service.deletesendMessage(msg_seq) == 1
				? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
					value = "/{msg_seq}",
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> readMsgCheck(@RequestBody MessageVO vo, @PathVariable("msg_seq") int msg_seq){
		
		vo.setMsg_seq(msg_seq);
		
		log.info("MsgCheck msg_seq : " + msg_seq);
		
		log.info("MsgCheck : " + vo);
		
		return service.readMsgCheck(vo) == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping(value = "/rmc/{reader}",
			    produces = {MediaType.APPLICATION_XML_VALUE,
			    MediaType.APPLICATION_JSON_UTF8_VALUE})
	public int notReadMsgCount(@PathVariable("reader") String reader){
		
		return service.notReadMsgCount(reader);
		
	}
	
	@GetMapping(value = "/rm3/{reader}",
				produces = {MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<MessageVO>> unreadMsg3Cnt(@PathVariable("reader") String reader){
		
		return new ResponseEntity<>(service.unreadMsg3Cnt(reader), HttpStatus.OK);
		
	}
	
	@GetMapping(value = "/smc/{reader}",
		    	produces = {MediaType.APPLICATION_XML_VALUE,
		    			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public int memberCheck(@PathVariable("reader") String reader) {
		System.out.println(reader);
		return service.memberCheck(reader);
		
	}

}
