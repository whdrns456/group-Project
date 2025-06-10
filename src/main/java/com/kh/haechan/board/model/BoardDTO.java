package com.kh.haechan.board.model;

import java.sql.Date;

public class BoardDTO {
	
	  private String boardNo;
	  private String title;
	  private String content;
	  private String writer; // USERS_ID
	  private Date createDate; // Date
	  private int readCount;
	  
	  
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", createDate=" + createDate + ", readCount=" + readCount + "]";
	}

	  
	  
	
}
