package com.kh.haechan.comment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.haechan.comment.service.CommentService;
import com.kh.haechan.reply.model.ReplyDTO;

@Controller
public class CommentController {

	private CommentService cService;
	
	public CommentController(CommentService cService){
		this.cService = cService;
	}
	
	@PostMapping("comment")
	@ResponseBody
	public String InsertComment(@RequestBody ReplyDTO reply){
		int result =  cService.insertComment(reply);
		return result > 0 ? "success" : "fail";
	}
	
	@PostMapping("reply")
	@ResponseBody
	public String InsertReply(@RequestBody ReplyDTO reply){
		int result = cService.insertReply(reply);
		return result > 0 ? "success" : "fail"; 
	}
	
	@DeleteMapping("comment")
	@ResponseBody
	public String deletedComment(@RequestBody ReplyDTO reply){
		int result = cService.deleteComment(reply);
		return result > 0 ? "success" : "fail";
	}
	
	@PutMapping("comment")
	@ResponseBody
	public String updateComment(@RequestBody ReplyDTO reply){
		int result = cService.updateComment(reply);
		return result > 0 ? "success" : "fail";
	}
}
