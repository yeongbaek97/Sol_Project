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
	<table border="1" id="postTable" style="width: 400px;">
		<tr>
			<td>${post.b_no }</td>
			<td>${post.b_title }</td>
			<td>${post.b_writer }</td>
			<td><fmt:formatDate value="${post.b_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td>댓글 ${post.b_comments }</td>
			<td>조회 ${post.b_views }</td>
		</tr>
		<tr>
			<td><img src="resources/img/${post.b_image }" style="width: auto; height: auto; max-width: 600px; max-height: 400px; "></td>
			<td>${post.b_content }</td>
		</tr>
	</table>
	
	<input type="hidden" id="b_title" value="${post.b_title }">
	<input type="hidden" id="b_content" value="${post.b_content }">
	<input type="hidden" id="b_image" value="${post.b_image }">

	<div>
		<c:if test="${post.b_writer eq sessionScope.loginMember.m_id}">
			<button id="modifyButton" onclick="modifyPost();">수정</button>
			<button id="deleteButton" onclick="deletePost();">삭제</button>
		</c:if>
		<button onclick="location.href='goto.board'">목록으로</button>
	</div>
	
	<input type="hidden" id="c_no" value="${post.b_no }">
	<input type="hidden" id="c_writer" value="${sessionScope.loginMember.m_id}">
	<textArea id="c_comment" style="width: 400px; margin-top: 50px;"></textArea>
	<button onclick="writeComment();">등록</button>
	
	<table id="commentTable">
		<c:forEach var="c" items="${comments }">
			<tr>
				<td><input id="c_seq" type="hidden" value="${c.c_seq }"></td>
				<td>${c.c_writer }</td>
				<td>${c.c_comment }</td>
				<td><c:if test="${c.c_writer eq sessionScope.loginMember.m_id}"><button id="modifyButton2" onclick="modifyComment();">수정</button></c:if></td>
				<td><c:if test="${c.c_writer eq sessionScope.loginMember.m_id}"><button onclick="deleteComment();">삭제</button></c:if></td>
				<td><fmt:formatDate value="${c.c_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			</c:forEach>
	</table>
</body>
</html>