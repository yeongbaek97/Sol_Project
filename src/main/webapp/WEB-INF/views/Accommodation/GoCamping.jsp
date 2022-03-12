<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="#">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn").click(function() {
		var areaCode = document.getElementById("areaCode").value;
		var pageNo = document.getElementById("pageNo").value;
		location.href="gocamping.json?areaCode=" + areaCode + "&pageNo=" + pageNo;
	});
})
</script>
<style type="text/css">
th{
	padding-left: 10px;
	padding-right: 10px;
}

td{
	padding-left: 10px;
	padding-right: 10px;

}
</style>
</head>
<body>


	<h3>숙박정보</h3>


	<select id="areaCode" name="areaCode">
		<option value="서울시" selected>서울</option>
		<option value="인천시">인천</option>
		<option value="대전시">대전</option>
		<option value="대구시">대구</option>
		<option value="광주시">광주</option>
		<option value="부산시">부산</option>
		<option value="울산시">울산</option>
		<option value="세종시">세종특별자치시</option>
		<option value="경기도">경기도</option>
		<option value="강원도">강원도</option>
		<option value="충청북도">충청북도</option>
		<option value="충청남도">충청남도</option>
		<option value="경상북도">경상북도</option>
		<option value="경상남도">경상남도</option>
		<option value="전라북도">전라북도</option>
		<option value="전라남도">전라남도</option>
		<option value="제주도">제주도</option>
	</select>

	<table>
		<tr>
			<td>
				<select id="pageNo" name="pageNo">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>				
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" id="btn">검색</button>
			</td>
		</tr>
	</table>

	<hr>

	<table>
		<tr style="text-align: center;">
			<th>숙소명</th>
			<th>주소</th>
			<th>도</th>
			<th>이미지</th>
		</tr>
	<c:forEach var="g" items="${gocamping }">
		<tr>
			<td>${g.title }</td>
			<td>${g.addr }</td>
			<td>${g.dosi }</td>
			<td><img src="${g.img }" style="width: 250px; height: 150px;"></td>
		</tr>
	</c:forEach>
	</table>

	<aside id="sidebar2" class="kakaoMap_sidebar" style="border: 3px solid #DBDBDB;">
	<button class="btn_a">지도 검색</button>
		<div class="kakaoMap_sidebar_select">
			<input style="width: 300px;" class="form-control border-1 py-2 ps-4 pe-4" id="search" type="text" placeholder="키워드 입력" autocomplete="off">
			<br>
			<div style="width: 870px; height: 500px;">
				<div id="map" style="width:800px; height:500px; float: left;"></div>
				<!-- 
				<button id="narrow">좁은 구역 보기</button>
				<button id="wide">넓은 구역 보기</i></button>
				 -->
				<div style="float: right;">
				<button id="narrow" style="border-radius: 30px 30px 30px 30px; margin: 10px;" class="btn btn-lg btn-primary btn-lg-square"><i class="bi bi-plus"></i></button>
				<button id="wide" style="border-radius: 30px 30px 30px 30px; margin: 10px;" class="btn btn-lg btn-secondary btn-lg-square"><i class="bi bi-dash"></i></button>
				</div>
				<input type="hidden" id="x" value="${param.x }">
				<input type="hidden" id="y" value="${param.y }">
			</div>
		</div>
	</aside>

	
</body>
</html>