<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

th, td {
	padding: 15px 10px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

a {
	text-decoration: none;
	color: #007bff;
}

a:hover {
	text-decoration: underline;
}

#footer-div {
	position: absolute;
	bottom: 0px;
	width: 100%;
}
</style>
</head>

<body>
	<div id="header-div">
		<jsp:include page="../common/header.jsp"></jsp:include>
	</div>
	<c:choose>
		<c:when test="${empty boardList}">
			<tr>
				<td>동록된 게시글이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<h2>게시판</h2>
			<div id="boardList-div">
				<a href="boardWrite.do">글쓰기</a>
				<table border="1">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="b" items="${boardList}">
						<tr>
							<td>${b.boardNo}</td>
							<td><a href="boardDetail.do?boardNo=${b.boardNo}">${b.title}</a></td>
							<td>${b.writer}</td>
							<td><fmt:formatDate value="${b.createDate}"
									pattern="yyyy-MM-dd" /></td>
							<td>${b.readCount}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
	<div id="footer-div">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>

</html>