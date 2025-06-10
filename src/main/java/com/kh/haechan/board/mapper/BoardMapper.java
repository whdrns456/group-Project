package com.kh.haechan.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.haechan.board.model.BoardDTO;
import com.kh.haechan.reply.model.ReplyDTO;

@Mapper
public interface BoardMapper {

	List<BoardDTO> selectBoard();
	BoardDTO selectBoardDetail(String boardNo);
	int increaseReadCount(String boardNo);
	int updateBoard(BoardDTO board);
	int deletedBoard(String boardNo);
	int insertBoard(BoardDTO board);
	List<ReplyDTO> searchReply(String boardNo);

}
