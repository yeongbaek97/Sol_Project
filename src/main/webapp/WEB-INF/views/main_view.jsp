<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인(홈)화면입니다</h1>
	
	<c:forEach  var="trl" items="${tourRankList }" varStatus="status">
		<table border="1">
			<tr>
				<td>${status.index + 1}</td>
				<td>${trl.contentid}</td>
				<td>${trl.title}</td>
				<td>${trl.count}</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>