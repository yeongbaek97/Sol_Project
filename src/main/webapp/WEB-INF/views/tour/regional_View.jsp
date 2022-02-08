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
		<table class="tourtbl">
			<tr>
				<td><a href="tour.list.regional?areaCode=1">서울</a></td>
				<td><a href="tour.list.regional?areaCode=2">인천</a></td>
				<td><a href="tour.list.regional?areaCode=3">대전</a></td>
				<td><a href="tour.list.regional?areaCode=4">대구</a></td>
				<td><a href="tour.list.regional?areaCode=5">광주</a></td>
				<td><a href="tour.list.regional?areaCode=6">부산</a></td>
				<td><a href="tour.list.regional?areaCode=7">울산</a></td>
				<td><a href="tour.list.regional?areaCode=8">세종</a></td>
				<td><a href="tour.list.regional?areaCode=31">경기도</a></td>
			</tr>
			<tr>				
				<td><a href="tour.list.regional?areaCode=32">강원도</a></td>
				<td><a href="tour.list.regional?areaCode=33">충청북도</a></td>
				<td><a href="tour.list.regional?areaCode=34">충청남도</a></td>
				<td><a href="tour.list.regional?areaCode=35">경상북도</a></td>
				<td><a href="tour.list.regional?areaCode=36">경상남도</a></td>
				<td><a href="tour.list.regional?areaCode=37">전라북도</a></td>
				<td><a href="tour.list.regional?areaCode=38">전라남도</a></td>
				<td><a href="tour.list.regional?areaCode=39">제주도</a></td>
			</tr>
		</table>
	</div>

	<div class="tour_list_view">
		<c:forEach var="c" items="${tourList}">
			<div id="dd" onclick="location.href='tour.list.detail?contentid=${c.contentid }'">
			<img src="${c.firstimage2 }" style="width:300px;height:150px;object-fit: cover;">
			${c.title }
			${c.addr1 }
			${c.contentid }
			</div>
		</c:forEach>

	</div>

	<!-- 페이징 부분 뷰는 추후에 작업예정 -->
	<c:if test="${curPage != 1 }">
		<a href="tour.list.regional_change?p=${curPage - 1 }">이전</a>
	</c:if>
	<c:if test="${curPage != pageCount }">
		<a href="tour.list.regional_change?p=${curPage + 1 }">다음</a>
	</c:if>

	

</body>
</html>