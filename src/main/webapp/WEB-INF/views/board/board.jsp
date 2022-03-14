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
	<div align="center" style="margin-top:200px;">
	<form id="postForm" action="detail.post" method="post" enctype="multipart/form-data">
		<input type="hidden" id="b_no" name="b_no">
		<table border="1" style="">
			<tr align="center" style="">
				<th style="width: 50px;">번호</th>
				<th style="width: 500px;">제목</th>
				<th style="width: 100px;">작성자</th>
				<th style="width: 50px;">댓글</th>
				<th style="width: 50px;">조회</th>
				<th style="width: 100px;">날짜</th>
			</tr>
			
			<c:forEach var="p" items="${posts }">
			<tr id="post" onclick="detailPost();" align="center" style="height:40px;">
				<td>${p.b_no }</td>
				<td align="left" style="padding-left: 20px;">${p.b_title }</td>
				<td>${p.b_writer }</td>
				<td>${p.b_comments }</td>
				<td>${p.b_views }</td>
				<td><fmt:formatDate value="${p.b_date }" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</table>
	</form>
	
	<button onclick="gotoWrite();" style="margin-top: 20px">글쓰기</button>
	</div>
	
	<input id="loginCheck" type="hidden" value="${sessionScope.loginMember.m_id}">
	
</body>
</html>