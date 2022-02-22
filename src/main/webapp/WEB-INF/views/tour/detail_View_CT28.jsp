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

${tourdetail.accomcountleports }
${tourdetail.chkbabycarriageleports }
${tourdetail.openperiod }

<hr>

<hr>
<div>
			<c:forEach var="c" items="${originimgurl}">
				<img src="${c }" width="350px" height="200px">
			</c:forEach>
		</div>

<jsp:include page="${kakaoMap }"></jsp:include>
</body>
</html>