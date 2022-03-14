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
<div class="wrap">
	<div style="margin-left:10%;margin-right:10%; margin-top: 198px;padding: 50px;border-bottom:1px solid #d8d8d8;">
		<h1> 여행 게시판</h1>
	</div>


	<div align="right" style="margin-top:38px; margin-right: 10%;">
		<button onclick="location.href='/dbtest'" style="margin-bottom:8px">더미추가</button>
		<button onclick="gotoWrite();" style="margin-bottom:8px">글쓰기</button>
	</div>
	<div align="center" style="margin-left: 10%;margin-right: 10%;padding: 20px 50px 50px 50px;">
	
	
	<form id="postForm" action="detail.post" method="post" enctype="multipart/form-data">
		<input type="hidden" id="b_no" name="b_no">
		<table border="1" style="width: 100%; padding: 15px;margin: 0">
			<tr align="center" style="border-bottom : 1px solid #d8d8d8;height:48px;padding: 4px ">
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
	
	<div style="padding-top: 20px;">
		<c:if test="${param.curPage gt 10 }">
			<a href='goto.board?curPage=${(p.boardPage-2)*10+1}'>◀ &nbsp;&nbsp;&nbsp;</a>
		</c:if>
		
		<c:if test="${p.endPage lt p.lastPage }">
		<c:forEach begin="${p.startPage }" end="${p.endPage }" varStatus="status">
			<a href='goto.board?curPage=${((p.boardPage-1)*10)+status.count }'>${((p.boardPage-1)*10)+status.count } &nbsp;&nbsp;&nbsp;</a>
		</c:forEach>
		</c:if>
		
		<c:if test="${p.endPage gt p.lastPage }">
		<c:forEach begin="${p.startPage }" end="${p.lastPage }" varStatus="status">
			<a href='goto.board?curPage=${((p.boardPage-1)*10)+status.count }'>${((p.boardPage-1)*10)+status.count } &nbsp;&nbsp;&nbsp;</a>
		</c:forEach>
		</c:if>
		
		<c:if test="${p.endPage lt p.lastPage }">
			<a href='goto.board?curPage=${p.boardPage*10+1}'>▶</a>
		</c:if>
	</div>
	
	<input id="loginCheck" type="hidden" value="${sessionScope.loginMember.m_id}">
	</div>
</body>
</html>