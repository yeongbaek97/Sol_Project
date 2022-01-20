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

<div>
	<table>
		<tr>
			<td><a href="tour.list.regional?areaCode=1" >서울</a></td>
			<td><a href="tour.list.regional?areaCode=2" >1</a></td>
			<td><a href="tour.list.regional?areaCode=3" >2</a></td>
			<td><a href="tour.list.regional?areaCode=4" >3</a></td>
			<td><a href="tour.list.regional?areaCode=5" >4</a></td>
		</tr>
	</table>
</div>


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
		<a href="tour.list.regional_change?p=${curPage - 1 }" >이전</a>
	</c:if>
	<c:if test="${curPage != pageCount }">
		<a href="tour.list.regional_change?p=${curPage + 1 }" >다음</a>
	</c:if>

</body>
</html>