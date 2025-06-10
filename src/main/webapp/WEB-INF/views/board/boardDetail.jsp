<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
	    * {
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background-color: #f7f7f7;
        padding: 40px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		
    }
	#board-table{
		width: 100%;
		height: 50%;
	}

	#flex-div{
		display: flex;
		flex-direction: column;
		justify-content: center;
		margin: auto;
	}
	
	.comment-div{
		width: 100%;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	.comment-div button{
	margin: auto;
	width: 10%;
	}	
	.child-replies{
		display: none;
		margin-left: 20px;
	}

</style>
</head>
<body>
		<h3>게시글 상세 보기 페이지</h3>
		
		<table id="board-table">
			<tr>
				<th>
					게시글 번호
				</th>
				<td>
					${board.boardNo}
				</td>
			</tr>
			<tr>
				<th>
					제목
				</th>
				<td>
					${board.title}
				</td>
			</tr>
			<tr>
			<th>
				작성자	
			</th>
			<td>
				${board.writer}
			</td>
		</tr>
		<tr>
			<th>
				작성일
			</th>
			<td>
				${createDate}
			</td>
		</tr>
		<tr>
			<th>
				조회수
			</th>
			<td>
				${board.readCount}
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				${board.content}
			</td>
		</tr>
		</table>
		<input type="hidden" id="usersId" value="${sessionScope.loginUser.usersId}" />

		<div class="comment-div">
			<button class="comment-btn" data-action="add" data-type="parent" data-board-no="${board.boardNo}">
					댓글 작성
			</button>
		</div>
<c:forEach var="r" items="${reply}">
    <div class="reply">	
        <strong>${r.usersId}</strong>: ${r.content}	     
				<button class="comment-btn" data-action="add" data-type="child" data-parent-id="${r.commentId}" data-board-no="${board.boardNo}">
					댓글 작성
				</button>

        <c:if test="${sessionScope.loginUser.usersId eq  r.usersId}">
        		<button class="comment-btn" data-action="delete" data-reply-id="${r.commentId}">
        			댓글 삭제
        		</button>
        		<button class="comment-btn" data-action="edit" data-reply-id="${r.commentId}">
        			댓글 수정
        		</button>
        </c:if>
    <c:if test="${not empty r.children}">
		<button class="toggle-reply" data-comment-id="${r.commentId}">
			펼치기
		</button>
	</c:if>
		<!--대댓글 (초기 숨김)-->
		<div class="child-replies" id="replies-${r.commentId}">
        <c:forEach var="c" items="${r.children}">
            <div class="child-reply">↳ <strong>${c.usersId}</strong>: ${c.content}
             <c:if test="${sessionScope.loginUser.usersId eq  c.usersId}">
        		<button class="comment-btn" data-action="delete" data-reply-id="${c.commentId}">
        			댓글 삭제
        		</button>
        		<button class="comment-btn" data-action="edit" data-reply-id="${c.commentId}">
        			댓글 수정
        		</button>
        </c:if>
        </div>
	</div>
        </c:forEach>
    </div>
</c:forEach>
	<div id="flex-div">
		<a href="boardList.do">목록으로</a>
		<c:if test="${sessionScope.loginUser.usersId eq board.writer}">
		<button onclick="location.href='boardUpdate.do?boardNo=${board.boardNo}'">수정</button>
		<button id="boardDelete" >삭제</button>
		</c:if>
		<input id="boardDeleteValue" type="hidden" value="${board.boardNo}">
	</div>
	<script src="resources/js/comment/comment.js"></script>

	<script>
		window.onload = function() {
			const deletedValue = document.getElementById("boardDeleteValue").value;

			document.getElementById("boardDelete").addEventListener('click', async function(){
				
			if (!confirm("정말 삭제하시겠습니까?")) return;		
			
			const data = {
				boardNo :deletedValue
			}
			try{
			const response = await fetch("boardDelete",{
				method: "post",
				headers: {"Content-Type" : "application/json"},
				body: JSON.stringify(data)
			});
			const request = await response.text();

			if(request == 'success'){
				alert('삭제 완료되었습니다.');
				location.href = "/haechan/boardList.do";
			}else{
				alert('삭제 실패');
			}
		}catch(e){
			console.error(e);
		}
			
			});

		}
	</script>
</body>
</html>