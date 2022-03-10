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
<div class="wrap">	
	<div class="inner-list">
		<c:forEach  var="trl" items="${tourRankList }" varStatus="status">
			<div class="inner">
				${trl.contentid}
				${trl.title}
				<img src="${trl.image }"style="width: 300px; height: 150px; object-fit: cover;">
			</div>
		</c:forEach>
	
	</div>
	
	<div class="button-list">
  		<button class="button-left">← Left</button>
 		<button class="button-right">Right →</button>
	</div>
</div>
</body>
</html>