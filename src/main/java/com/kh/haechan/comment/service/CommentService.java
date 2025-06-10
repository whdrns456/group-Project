package com.kh.haechan.comment.service;

import org.springframework.stereotype.Service;

import com.kh.haechan.comment.mapper.CommentMapper;
import com.kh.haechan.reply.model.ReplyDTO;

@Service
public class CommentService {

	private final CommentMapper cMapper;

	public CommentService(CommentMapper cMapper) {
		this.cMapper = cMapper;
	}
	
	public int insertComment(ReplyDTO reply) {
		return cMapper.insertComment(reply);
	}

	public int insertReply(ReplyDTO reply) {
		return cMapper.insertReply(reply);
	}

	public int deleteComment(ReplyDTO reply) {
		return cMapper.deleteComment(reply);
	}

	public int updateComment(ReplyDTO reply) {
		return cMapper.updateComment(reply);
	}

}
