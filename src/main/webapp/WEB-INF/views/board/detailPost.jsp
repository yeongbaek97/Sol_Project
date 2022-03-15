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
	<table border="1" id="postTable" style="width: 800px;">
		<tr>
			<td align="center" style="width: 100px;">${post.b_no }</td>
			<td style="width: 550px;">${post.b_title }</td>
			<td align="center" colspan="2" style="width: 150px;"><fmt:formatDate value="${post.b_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td align="center">${post.b_writer }</td>
			<td></td>
			<td align="center">댓글 ${post.b_comments }</td>
			<td align="center">조회 ${post.b_views }</td>
		</tr>
		<tr>
			<td colspan="3" style="padding: 8px;"><img src="resources/img/${post.b_image }" style="width: auto; height: auto; max-width: 500px; max-height: 500px; ">
			<br><br><br>${post.b_content }</td>
		</tr>
	</table>
	
	<input type="hidden" id="b_title" value="${post.b_title }">
	<input type="hidden" id="b_content" value="${post.b_content }">
	<input type="hidden" id="b_image" value="${post.b_image }">

	<div style="padding-top: 20px;">
		<c:if test="${post.b_writer eq sessionScope.loginMember.m_id}">
			<button id="modifyButton" onclick="modifyPost();" class="btn btn-outline-warning" style="margin: 5px;">수정</button>
			<button id="deleteButton" onclick="deletePost();" class="btn btn-outline-danger" style="margin: 5px;">삭제</button>
		</c:if>
		<button onclick="location.href='goto.board'" class="btn btn-outline-secondary" style="margin: 5px;">목록으로</button>
	</div>
	
	<div style="height: 150px;">
		<input type="hidden" id="c_no" value="${post.b_no }">
		<input type="hidden" id="c_writer" value="${sessionScope.loginMember.m_id}">
		<table>
		
		<tr><td><textArea id="c_comment" style="width: 800px; height: 60px;margin-top: 50px;"></textArea></td>
		<td><button onclick="writeComment();" class="btn btn-primary" style="margin-left: 15px; margin-top: 44px; height: 60px;">등록</button></tr>
		</table>
	</div>
	
	<table id="commentTable" style="width: 940px;">
		<c:forEach var="c" items="${comments }">
			<tr>
				<td><input id="c_seq" type="hidden" value="${c.c_seq }"></td>
				<td style="width: 80px;">${c.c_writer }</td>
				<td style="width: 550px;">${c.c_comment }</td>
				<td style="width: 80px;"><c:if test="${c.c_writer eq sessionScope.loginMember.m_id}"><button id="modifyButton2" class="btn btn-outline-warning" onclick="modifyComment();">수정</button></c:if></td>
				<td style="width: 80px;"><c:if test="${c.c_writer eq sessionScope.loginMember.m_id}"><button class="btn btn-outline-danger" onclick="deleteComment();">삭제</button></c:if></td>
				<td style="width: 150px;"><fmt:formatDate value="${c.c_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			</c:forEach>
	</table>
	</div>
</body>
</html>