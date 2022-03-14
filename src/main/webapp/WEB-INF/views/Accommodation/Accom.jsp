<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jQuery.js"></script>
<script type="text/javascript" src="resources/js/accommodation.js"></script>
<script src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
</head>
<body>
<div class="wrap">

<div class="option_select">
	<div class="select_areaCode_option">
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
		
		<button type="button" id="btn">검색</button>
	</div>

	
</div>
	
	
	
	<div style="width: 50%; float: left;padding-left: 100px;">
		<ul id="accom_list_item"></ul>

		<ul id="pagingul" style=" float: left;margin-left: 98px;">
	</ul>
	</div>
	
	
	<div style="width: 50%; float: right;">		<!-- 이곳에 해주세요 -->
		<div id="accomMap" style="width:800px; height:600px;margin-top: 12px;margin-right: 10%;"></div>
	</div>



</div>
	





	
	
	


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