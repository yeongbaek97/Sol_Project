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
<div style="background-color: #eeeeee; width: 60%; position:absolute;">
	${tourdetail.accomcountculture }
	${tourdetail.chkbabycarriageculture }
	${tourdetail.chkpetculture }
	${tourdetail.discountinfo }
	${tourdetail.infocenterculture }
	
	<hr>
	
	<hr>
	${tourdetail3.createdtime }
	
	<jsp:include page="${kakaoMap }"></jsp:include>
</div>
</body>
</html>