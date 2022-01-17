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

<script type="text/javascript">


</script>
</head>
<body>

	<!-- 로그인 화면 div -->
	<div style="text-align: center; padding-top: 70px; padding-bottom: 50px;">
		<input><button>검색(아이콘)</button>
		
		<jsp:include page="${loginPage }"></jsp:include>
		<!-- 카카오로그인 -->
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=500a463927b5af4c4a3224e8a14e8ace&redirect_uri=http://localhost/pj/kakao.login&response_type=code">
		<img src="resources/img/kakao_login_medium_narrow.png">
		</a>
	</div>
	

	<!-- 네비바 -->
	<div style="width: 5000px;">
		<ul class="navi">
			<li><a href="#">홈</a></li>
			<li><a href="tour.list">>여행지</a></li>
			<li><a href="#">여행게시판</a></li>
			<li><a href="#">숙소</a></li>
		</ul>
	</div>
</body>
</html>