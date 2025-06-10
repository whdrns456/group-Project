package com.kh.haechan.reply.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class ReplyDTO {
	
	private Long commentId;
	private String boardNo;
	private String usersId;
	private String content;
	private Long parentId;
	private Date createDate;
	
	// 대댓글을 저장하기 위해서
	private List<ReplyDTO> children = new ArrayList<>();
	
	
	public List<ReplyDTO> getChildren() {
		return children;
	}
	public void setChildren(List<ReplyDTO> children) {
		this.children = children;
	}

	public Long getCommentId() {
		return commentId;
	}
	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "ReplyDTO [commentId=" + commentId + ", boardNo=" + boardNo + ", usersId=" + usersId + ", content="
				+ content + ", parentId=" + parentId + ", createDate=" + createDate + ", children=" + children + "]";
	}

	
}
