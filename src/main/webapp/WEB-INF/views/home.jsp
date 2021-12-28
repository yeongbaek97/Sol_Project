<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home.css">
</head>
<body>

	<div style="text-align: center; padding-top: 70px; padding-bottom: 50px;">
		<input><button>검색(아이콘)</button>
		
		<jsp:include page="${loginPage }"></jsp:include>
	</div>
	

	<div style="width: 5000px;">
		<ul class="navi">
			<li><a href="/">홈</a></li>
			<li><a href="#">테마</a></li>
			<li><a href="#">지역</a></li>
			<li><a href="#">주변</a></li>
		</ul>
	</div>
</body>
</html>