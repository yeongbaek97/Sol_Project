<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/js/move.js"></script>
</head>
<body>
	<h1>메인(홈)화면입니다</h1>
	
	<c:forEach  var="trl" items="${tourRankList }" varStatus="status">
		<table border="1">
			<tr>
				<td>${status.index + 1}</td>
				<td>${trl.contentid}</td>
				<td>${trl.title}</td>
				<td><img src="${trl.image }"style="width: 300px; height: 150px; object-fit: cover;"></td>
				<td>${trl.count}</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>