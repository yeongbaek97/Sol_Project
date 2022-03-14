<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="postForm" action="detail.post" method="post" enctype="multipart/form-data">
		<input type="hidden" id="b_no" name="b_no">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>댓글</th>
				<th>조회</th>
				<th>날짜</th>
			</tr>
			
			<c:forEach var="p" items="${posts }">
			<tr id="post" onclick="detailPost();">
				<td>${p.b_no }</td>
				<td>${p.b_title }</td>
				<td>${p.b_writer }</td>
				<td>${p.b_comments }</td>
				<td>${p.b_views }</td>
				<td><fmt:formatDate value="${p.b_date }" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
			
		</table>
		
	</form>
	<button onclick="location.href='goto.write'">글쓰기</button>
	
</body>
</html>