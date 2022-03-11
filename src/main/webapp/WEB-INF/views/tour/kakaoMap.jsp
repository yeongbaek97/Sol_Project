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
<div style="width: 870px; height: 300px;">
	<div id="map" style="width:800px; height:300px; float: left;"></div>
	<!-- 
	<button id="narrow">좁은 구역 보기</button>
	<button id="wide">넓은 구역 보기</i></button>
	 -->
	<div style="float: right;">
	<button id="wide" style="border-radius: 30px 30px 30px 30px; margin: 10px;" class="btn btn-lg btn-primary btn-lg-square"><i class="bi bi-plus"></i></button>
	<button id="narrow" style="border-radius: 30px 30px 30px 30px; margin: 10px;" class="btn btn-lg btn-secondary btn-lg-square"><i class="bi bi-dash"></i></button>
	</div>
	<input type="hidden" id="x" value="${param.x }">
	<input type="hidden" id="y" value="${param.y }">
</div>
</body>
</html>