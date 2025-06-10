package com.kh.haechan.comment.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kh.haechan.reply.model.ReplyDTO;

@Mapper
public interface CommentMapper {

	int insertComment(ReplyDTO reply);
	int insertReply(ReplyDTO reply);
	int deleteComment(ReplyDTO reply);
	int updateComment(ReplyDTO reply);

}
