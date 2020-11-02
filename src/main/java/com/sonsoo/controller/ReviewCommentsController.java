package com.sonsoo.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sonsoo.domain.ReviewCommentsVO;
import com.sonsoo.service.ReviewCommentsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReviewCommentsController {

	private ReviewCommentsService service;
	
	@PostMapping(value="/new",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReviewCommentsVO rcvo){
		
		System.out.println("jhgfjh");
		
		log.info("ReviewCommentsVO : " + rcvo);
		
		int insertCount = service.insertReviewComments(rcvo);
		
		log.info("Comments INSERT COUNT : " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping(value="/pages/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReviewCommentsVO>> getList(ReviewCommentsVO rcvo){
		
		log.info("getList..........");
		
		return new ResponseEntity<>(service.getReviewCommentsList(rcvo),HttpStatus.OK);
	
	}
	
	@DeleteMapping(value="/{rcno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(ReviewCommentsVO rcvo){
		
		log.info("remove : " + rcvo.getRcno());
		
		return service.deleteReviewComments(rcvo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
}
