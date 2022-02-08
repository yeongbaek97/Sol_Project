<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jQuery.js"></script>
<script type="text/javascript" src="resources/accommodation.js"></script>
<script src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
</head>
<body>

	<select id="areaCode" name="areaCode">
		<option value="1" selected>서울</option>
		<option value="2">인천</option>
		<option value="3">대전</option>
		<option value="4">대구</option>
		<option value="5">광주</option>
		<option value="6">부산</option>
		<option value="7">울산</option>
		<option value="8">세종특별자치시</option>
		<option value="31">경기도</option>
		<option value="32">강원도</option>
		<option value="33">충청북도</option>
		<option value="34">충청남도</option>
		<option value="35">경상북도</option>
		<option value="36">경상남도</option>
		<option value="37">전라북도</option>
		<option value="38">전라남도</option>
		<option value="39">제주도</option>
	</select>

	<select id="classification" name="classification">
		<option value="B02010100">호텔</option>
		<option value="B02010900">모텔</option>
		<option value="B02010700">펜션</option>
		<option value="B02010500">콘도</option>
		<option value="B02011000">민박</option>
		<option value="B02011100">게스트하우스</option>
		<option value="B02011200">홈스테이</option>
		<option value="B02011300">서비스드레지던스</option>
		<option value="B02011600">한옥스테이</option>
		<option value="B02010400">가족호텔</option>
		<option value="B02010600">유스호스텔</option>
	</select>

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


	<p>

		<button type="button" id="btn">검색</button>
	<hr>

	<!-- 
	<table>
		<tr>
			<th>이름</th>
			<th>주소</th>
			<th>썸네일</th>
			<th>분류</th>
			<th>경도</th>
			<th>위도</th>
		</tr>
	<c:forEach var="a" items="${accom }">
		<tr>
			<td>${a.title }</td>
			<td>${a.addr }</td>
			<td>${a.img }</td>
			<td>${a.classifi }</td>
			<td>${a.mapX }</td>
			<td>${a.mapY }</td>
		</tr>
	</c:forEach>
	</table>
 -->

	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>주소</th>
				<th>썸네일</th>
				<th>분류</th>
				<th>경도</th>
				<th>위도</th>
			</tr>		
		</thead>
		<tbody id="accomTBody">
		</tbody>
	</table>


</body>
</html>