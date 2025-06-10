<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
	crossorigin="anonymous">
<script src="resources/js/indexPage.js"></script>
</head>
<body>

	<div id="header-div">
		<jsp:include page="common/header.jsp"></jsp:include>
	</div>
	
	<div class="container">
		<c:if test="${not empty errorMsg}">
			<p style="color: red;">${errorMsg}</p>
		</c:if>

		<h1>Hello jsp</h1>
		<div id="login-div">

			<c:if test="${empty sessionScope.loginUser}">
				<button onclick="location.href='loginPage.do'" id="login-btn">로그인</button>
			</c:if>

			<c:if test="${not empty sessionScope.loginUser}">
				<span id="session-userId">${sessionScope.loginUser.usersId}님</span>
				<button id="logout-btn">로그아웃</button>
			</c:if>

		</div>

		<a href="boardList.do">게시글 조회하기</a>
		<p>ㅇㅇㅇㅇ</p>
		<table>
			<thead>
				<tr>
					<td>gg</td>
					<td>sss</td>
				</tr>
			</thead>
			<tr>
				<td>gg</td>
				<td>sss</td>
			</tr>
			<tbody>
			</tbody>

		</table>
	</div>
	<div id="footer-div">
		<jsp:include page="common/footer.jsp"></jsp:include>
	</div>
</body>
</html>