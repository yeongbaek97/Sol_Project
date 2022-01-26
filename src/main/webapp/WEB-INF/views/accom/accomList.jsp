<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/kakaoMap.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9e56e3f8a09664081781aefaf8493c0"></script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	
	<table>
		<tr>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=11">서울</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=26">부산</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=27">대구</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=28">인천</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=29">광주</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=30">대전</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=31">울산</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=36">세종</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=41">경기</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=42">강원</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=43">충북</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=44">충남</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=45">전북</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=46">전남</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=47">경북</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=48">경남</a></td>
			<td><a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=50">제주</a></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td>상호명</td>
			<td>분류</td>
			<td>지번 주소</td>
			<td>도로명 주소</td>
			<td>위도</td>
			<td>경도</td>
			<td></td>
		</tr>
		<c:forEach var="a" items="${accom}" varStatus="status">
			<tr>
				<td id="name">${a.bizesNm }</td>
				<td>${a.indsMclsNm }</td>
				<td>${a.lnoAdr }</td>
				<td>${a.rdnmAdr }</td>
				<td id="lon">${a.lon }</td>
				<td id="lat">${a.lat }</td>
				<td><button id="${status.current }">보기</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>