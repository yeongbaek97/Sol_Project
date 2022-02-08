<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="#">
<script type="text/javascript" src="resources/jQuery.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn").click(function() {
		var areaCode = document.getElementById("areaCode").value;
		var pageNo = document.getElementById("pageNo").value;
		location.href="/project/gocamping.json?areaCode=" + areaCode + "&pageNo=" + pageNo;
	});
})
</script>
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
	<c:forEach var="g" items="${gocamping }">
		<tr>
			<td>${g.title }</td>
			<td>${g.addr }</td>
			<td>${g.dosi }</td>
			<td>${g.img }</td>
		</tr>
	</c:forEach>
	</table>


	
</body>
</html>