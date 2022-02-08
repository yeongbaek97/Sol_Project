<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/tourapi.js"></script>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/accom.css">
<link rel="stylesheet" href="resources/css/tour.css">
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
			<li><a href="tour.concept.select">여행지</a>
				<ul>
					<li><a href="tour.concept.select">컨셉별</a></li>
					<li><a href="tour.list">등등</a></li>
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