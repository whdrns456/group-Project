package com.kh.haechan.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.haechan.board.mapper.BoardMapper;
import com.kh.haechan.board.model.BoardDTO;
import com.kh.haechan.reply.model.ReplyDTO;

@Service
public class BoardService {

	private final BoardMapper bMapper;
	
	public BoardService(BoardMapper bMapper){
		this.bMapper = bMapper;
	}
	
	public List<BoardDTO> selectBoard() {
		return bMapper.selectBoard();
	}
	public BoardDTO selectBoardDetail(String boardNo) {	
		return bMapper.selectBoardDetail(boardNo);
	}

	public void increaseReadCount(String boardNo) {
		bMapper.increaseReadCount(boardNo);	
	} // void도 이렇게 활용이 가능하다

	public int updatBoard(BoardDTO board) {
		return bMapper.updateBoard(board);
	}

	public int deletedBoard(String boardNo) {
		
		return bMapper.deletedBoard(boardNo);
	}

	public int insertBoard(BoardDTO board) {
		
		return bMapper.insertBoard(board);
	}

	public List<ReplyDTO> searchReply(String boardNo) {
		// 1. 전체 댓글 평탄화된 리스트로 조회
		List<ReplyDTO> flatList = bMapper.searchReply(boardNo);
		
		// 댓글 ID 기준으로 Map에 담아 빠르게 조회 가능하게 만들기
		// 모든 댓글을 저장해서 나중에 부모를 빠르게 찾아낼 수 있도록 준비
		Map<Long, ReplyDTO> map = new HashMap<>();
		
		List<ReplyDTO> result = new ArrayList<ReplyDTO>();
		// result는 화면에 뿌릴 최상위 댓글들만 모아두는 리스트
		
		for(ReplyDTO reply : flatList) {
			map.put(reply.getCommentId(), reply);
		}
		
		// 계층 구조 만들기 (부모-자식 관계 설졍)
		for(ReplyDTO reply : flatList){
			Long parentId = reply.getParentId(); 
			// parentId가 null일 경우 result에 저장
			if(parentId == null){
				result.add(reply); // 최상위 댓글
			}else {	//null이 아닐 경우 parent가 존재 즉 대댓글
				ReplyDTO parent = map.get(parentId);
				// parent = map.get
				if(parent != null){
					parent.getChildren().add(reply);
				}
			}
		}
		return result;
	}

}
