<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</style>
</head>
<body>
<c:if test="${not empty errorMsg}">
    <p style="color:red;">${errorMsg}</p>
</c:if>

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
      <td><fmt:formatDate value="${b.createDate}" pattern="yyyy-MM-dd"/></td>
      <td>${b.readCount}</td>
    </tr>
  </c:forEach>
        </table>
    </div>
</body>
</html>