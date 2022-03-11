<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/kakaoMap.js"></script>
</head>
<body>
<div id="map" style="width:800px; height:300px;"></div>
<!-- <button id="narrow">좁은 구역 보기</button>
<button id="wide">넓은 구역 보기</button> -->
<input type="hidden" id="x" value="${param.x }">
<input type="hidden" id="y" value="${param.y }">
</body>
</html>