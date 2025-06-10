package com.kh.haechan.board.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.haechan.board.model.BoardDTO;
import com.kh.haechan.board.service.BoardService;
import com.kh.haechan.reply.model.ReplyDTO;
import com.kh.heachan.user.model.UserDTO;

@Controller
public class BoardController {
	
	private final BoardService bService;
	
	public BoardController(BoardService bService){
		this.bService = bService;
	}
	
	@RequestMapping("boardWrite.do")
	public String boardWritePage(){
		return "board/boardInsert";
	}
	
	@PostMapping("insertBoard")
	@ResponseBody
	public String insertBoard(@RequestBody BoardDTO board){
		
	 System.err.println(board);
	 int result = bService.insertBoard(board);
		
		if(result > 0){
			 return "success";
	 	}
		return "failed";
	}
	
	@RequestMapping("boardList.do")
	public String boardList(HttpSession session, Model model, RedirectAttributes ra) {
		/* 
		 *  추천 방식 (실무 기준)
		 *
		 * */
		UserDTO user = (UserDTO)session.getAttribute("loginUser");
		
		if(user == null) {
		ra.addFlashAttribute("errorMsg", "로그인 이후 이용해주세요");	
		return "redirect:/";
		}
		
		List<BoardDTO> board = bService.selectBoard();
		
		if(board != null && !board.isEmpty()) 
		model.addAttribute("boardList", board);
		else model.addAttribute("errorMsg", "게시글을 조회할 수 없습니다.");			
		
		return "board/boardList";
	}
	
	@RequestMapping("boardDetail.do")
	public String boardDetailPage(@RequestParam("boardNo") String boardNo, Model model, HttpSession session){
		
		/**
		 *	현재 게시글	 
		 * 
		 */
		UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");

		if (loginUser == null) {
		    return "redirect:/loginPage.do"; // 로그인 안 되어 있으면 로그인 페이지로 이동
		}
		
		String userId = loginUser.getUsersId();
		
		@SuppressWarnings("unchecked")
		Set<String>viewBoard = (Set<String>)session.getAttribute("viewBoard");
		
		if(viewBoard == null){
			viewBoard = new HashSet<>();
			session.setAttribute("viewBoard", viewBoard);
		}
		
		List<ReplyDTO> reply = bService.searchReply(boardNo);
		BoardDTO board = bService.selectBoardDetail(boardNo);
		/*
		 *	작성자 본인 확인
		 * */
		if(board != null){	
			if(userId != null && !userId.equals(board.getWriter())&& !viewBoard.contains(boardNo)){
				bService.increaseReadCount(boardNo);
				viewBoard.add(boardNo);
			}
			model.addAttribute("reply", reply);
			model.addAttribute("board", board);
		}
		return "board/boardDetail";
	}	
	
	@RequestMapping("boardUpdate.do")
	public String boardUpdate(@RequestParam("boardNo") String boardNo,
			HttpSession session, Model model){
		UserDTO user = (UserDTO)session.getAttribute("loginUser");
		if(user == null){
			return "redirect:/loginPage.do";
		}
		String userId = user.getUsersId();
		BoardDTO board = bService.selectBoardDetail(boardNo);
		
		if(board == null ||  !userId.equals(board.getWriter())){
			return "redirect:/boardList.do";
		}
		model.addAttribute("board",board);
		return "board/boardUpdate"; 
	}
	@PostMapping("updateBoard")
	@ResponseBody
	public String updateBoard(/* @ModelAttribute*/ @RequestBody BoardDTO board) {
		System.out.println("수정할 데이터: " + board);
		int result = bService.updatBoard(board);
		
		if(result > 0){
			return "success";
		}
		return "falied";
	}
	
	@PostMapping("boardDelete")
	@ResponseBody
	public String deletedBoard(@RequestBody BoardDTO board){
		String boardNo = board.getBoardNo();
		
		int result = bService.deletedBoard(boardNo);
		
		if(result > 0){
			return "success";
		}else{
			return "failed";
		}
	}
	
	
	
}
