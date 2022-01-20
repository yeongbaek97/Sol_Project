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
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=11">서울</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=26">부산</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=27">대구</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=28">인천</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=29">광주</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=30">대전</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=31">울산</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=36">세종</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=41">경기</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=42">강원</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=43">충북</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=44">충남</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=45">전북</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=46">전남</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=47">경북</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=48">경남</a>
	<a href="accom.list?pageNo=1&indsMclsCd=O01&ctprvnCd=50">제주</a>
	
	<table>
		<tr>
			<td>상호명</td>
			<td>분류</td>
			<td>지번 주소</td>
			<td>도로명 주소</td>
			<td>위도</td>
			<td>경도</td>
		</tr>
		<c:forEach var="a" items="${accom}">
			<tr>
				<td>${a.bizesNm }</td>
				<td>${a.indsMclsNm }</td>
				<td>${a.lnoAdr }</td>
				<td>${a.rdnmAdr }</td>
				<td>${a.lon }</td>
				<td>${a.lat }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>