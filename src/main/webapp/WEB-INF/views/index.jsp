<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#login-div{
	position: absolute;
	right: 0.5%;
	width: 20%;
	background-color: rgb(195, 136, 18);
}
#logout-btn{
	padding: 16px;
	border: none;
	background-color: white;
	border-radius: 50px;
	margin-left: 150px;
	cursor: pointer;
	
}
#logout-btn:hover{
	background-color: rgba(255, 255, 255, 0.675);
}
#login-btn{
	width: 100%;
	height: 30%;
	background-color: rgb(195, 136, 18);
	border: none;
	text-align: center;
	color: rgba(255, 255, 255, 0.777);
	font-size: larger;
	padding: 10px;
}

#login-btn:hover{
	cursor: pointer;;
}

#session-userId{
	display: block;
	text-align: center;
	color: white;
	font-weight: bold;
	padding: 16px;
	font-size: larger;
}

</style>
<script src="resources/js/indexPage.js"></script>
</head>
<body>


<c:if test="${not empty errorMsg}">
    <p style="color:red;">${errorMsg}</p>
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
ㄴㄴㄴㄴㄴ
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
			asdasdasd
		</table>
</body>
</html>