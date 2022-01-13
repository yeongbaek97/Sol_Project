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

</body>
</html>