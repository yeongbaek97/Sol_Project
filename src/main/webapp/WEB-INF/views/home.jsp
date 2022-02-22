<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/tourapi.js"></script>
<script type="text/javascript" src="resources/js/kakaoMap.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9e56e3f8a09664081781aefaf8493c0&libraries=services"></script>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/accom.css">
<link rel="stylesheet" href="resources/css/tour.css">
<link rel="stylesheet" href="resources/css/kakaoMap.css">

<!--  -->
<link href="css/styles.css" rel="stylesheet" />

<script type="text/javascript">


</script>
</head>
<body>

        
	<!-- 로그인 화면 div -->
	<div style="text-align: center; padding-top: 70px; padding-bottom: 50px;">
		<input><button>검색(아이콘)</button>
		
		<jsp:include page="${loginPage }"></jsp:include>
		
	</div>
	

	<!-- 네비바 -->

	<div class="navi_div">
		<ul class="navi">
			<li><a href="home.go">홈</a></li>
			<li><a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=39">여행지</a>
				<ul>
					<li><a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=39">카페</a></li>
					<li><a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=15">행사/공연/축제</a></li>
					<li><a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=12">관광지</a></li>
					<li><a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=14">문화시설</a></li>
					<li><a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=28">레포츠</a></li>

					
				</ul>
			</li>
			<li><a href="">여행게시판</a></li>
			<li><a href="accom.home">숙소</a></li>
		</ul>
	</div>
	
	<div class="contentPage">
		<jsp:include page="${contentPage }"></jsp:include>
	</div>
</body>
</html>