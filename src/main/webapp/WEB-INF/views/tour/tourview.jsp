<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>투어리스트 화면</h3>


	<table>
	<c:forEach var="c" items="${tourList}">
		<tr>
			<td>${c.addr1 }</td>
			<td>${c.contentid }</td>
			<td>${c.title }</td>
			<td>${c.mapx }</td>
			<td>${c.mapy }</td>
		</tr>
	</c:forEach>
	</table>
	
	
	<!-- 페이징 부분 뷰는 추후에 작업예정 -->
	<c:if test="${curPage != 1 }">
		<a href="tour.list.change?p=${curPage - 1 }" >dddd</a>
	</c:if>
	<c:if test="${curPage != pageCount }">
		<a href="tour.list.change?p=${curPage + 1 }" >gggg</a>
	</c:if>

</body>
</html>