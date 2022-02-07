<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/kakaoMap.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9e56e3f8a09664081781aefaf8493c0&libraries=services"></script>
</head>
<body>

	<input id="search" placeholder="키워드 검색">
	<div id="map" style="width:500px;height:400px;"></div>
	<button id="narrow">좁은 구역 보기</button>
	<button id="wide">넓은 구역 보기</button>
	${param.x }
	${param.y }
</body>
</html>