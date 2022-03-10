<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>title</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<script type="text/javascript" src="resources/js/jQuery.js"></script>
<<<<<<< HEAD

<script type="text/javascript" src="resources/js/kakaoMap.js"></script>

<script type="text/javascript" src="resources/js/tourapi.js"></script>
<script type="text/javascript" src="resources/js/home.js"></script>

<script type="text/javascript" src="resources/js/move.js"></script>
<script type="text/javascript" src="resources/js/view.js"></script>


=======
<script type="text/javascript" src="resources/js/kakaoMap.js"></script>
<script type="text/javascript" src="resources/js/tourapi.js"></script>
<script type="text/javascript" src="resources/js/home.js"></script>
<script type="text/javascript" src="resources/js/move.js"></script>
<script type="text/javascript" src="resources/js/myPage.js"></script>
>>>>>>> f268fa98c2baa3ccdaf46f68c4995110005ff6f9
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9e56e3f8a09664081781aefaf8493c0&libraries=services"></script>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/accom.css">
<link rel="stylesheet" href="resources/css/tour.css">
<link rel="stylesheet" href="resources/css/kakaoMap.css">
<link rel="stylesheet" href="resources/css/main.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Favicon -->
<link href="resources/img/homeImage/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>
<<<<<<< HEAD
<input id="check_id" type="hidden" value="${sessionScope.loginMember.m_id}">
<input id="check_mapx" type="hidden" value="${tourdetailcommon.mapx }">
<input id="check_mapy" type="hidden" value="${tourdetailcommon.mapy }">
<input id="check_contentid" type="hidden" value="${tourdetail.contentid }">
<input id="check_title" type="hidden" value="${tourdetailcommon.title }">
	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
		<a class="navbar-brand text-light text-weight-bold px-5" href="home.go">Tour</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link text-light text-weight-bold px-5" href="goto.Index">Home<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle text-light text-weight-bold px-5" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">여행지</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=39">카페</a>
						<a class="dropdown-item" href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=12">관광지</a>
						<a class="dropdown-item" href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=15">행사/공연/축제</a>
						<a class="dropdown-item" href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=14">문화시설</a>
						<a class="dropdown-item" href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=28">레포츠</a>
						
					
					</div>
						
				</li>
				<li class="nav-item">
					<a class="nav-link text-light text-weight-bold px-5" href="#">여행게시판</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light text-weight-bold px-5" href="accom.home">숙소</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light text-weight-bold px-5" href="goto.accomIndex">숙소+캠핑</a>
				</li>
			</ul>
			
			<form class="form-inline my-2 my-lg-0 ml-3 navbar-right" onsubmit="return false;">
				<div class="block">
				    <ul id="ticker">
				    	<c:forEach  var="srl" items="${searchRankList }" varStatus="status">
				    		<c:if test="${status.index + 1 <= 10 }">
				        		<li><a href="#"><span>${status.index + 1}</span> ${srl.word}</a></li>
				        	</c:if>
				        </c:forEach>
				    </ul>
				</div>
				<input class="form-control mr-sm-2 my-2" id="word" type="search" placeholder="Search" aria-label="Search" onkeypress="if(event.keyCode==13){searchEnter();}" onclick="wordVisible();" autocomplete="off">
				
				<div class="form-control mr-sm-2 my-2" id="searchWord" style="background-color: efefef; position: absolute; top: 50px; right: 77px; height: 220px; width: 198px; visibility: hidden;">
					<table style="width:170px;">
						<c:forEach  var="srl" items="${searchRankList }" varStatus="status">
							<c:if test="${status.index + 1 <= 10 }">
								<tr>
									<td style="width: 20%;">${status.index + 1}</td>
									<td style="width: 80%;">${srl.word}</td>
								</tr>
							</c:if>
				        </c:forEach>
					</table>
				</div>
				
				<c:if test="${sessionScope.loginMember.m_id eq null && userInfo.nickname eq null}">
					<span class="sr-only">(current)</span>
					<button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='goto.login'">Sign in</button>
				</c:if>
				
				<c:if test="${sessionScope.loginMember.m_id ne null}">
					<span class="sr-only">(current)</span>
					<a class="nav-link disabled my-2 text-light" tabindex="-1" aria-disabled="true">${sessionScope.loginMember.m_name }(${sessionScope.loginMember.m_id })</a>
					<span class="sr-only">(current)</span>
					<button class="btn btn-outline-success my-2 my-sm-0 mb-n1" type="button" onclick="location.href='mypage'">내 정보</button>
					<button class="btn btn-outline-success my-2 my-sm-0 mb-n1" type="button" onclick="location.href='logout'">로그아웃</button>
				</c:if>
				
				<c:if test="${userInfo.nickname ne null }">
					<span class="sr-only">(current)</span>
					<a class="nav-link disabled my-2 text-light" tabindex="-1" aria-disabled="true">${userInfo.nickname }(${userInfo.email })</a>
					<span class="sr-only">(current)</span>
					<button class="btn btn-outline-success my-2 my-sm-0 mb-n1" type="button" onclick="location.href='logout'">로그아웃</button>
				</c:if>
			</form>
		</div>
	</nav>

	 
	<div>
		<jsp:include page="${contentPage }"></jsp:include>
	</div>


   <!-- Footer-->
        <footer class="footer bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2022 - 영백,현수,효진</div></div>
        </footer>
=======
	<input id="check_id" type="hidden" value="${sessionScope.loginMember.m_id}">
	<input id="check_mapx" type="hidden" value="${tourdetailcommon.mapx }">
	<input id="check_mapy" type="hidden" value="${tourdetailcommon.mapy }">
	<input id="check_contentid" type="hidden" value="${tourdetail.contentid }">
	<input id="check_title" type="hidden" value="${tourdetailcommon.title }">
	
	<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="goto.Index" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">Title</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="/goto.Index" class="nav-item nav-link active">Home</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">여행지</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=39" class="dropdown-item">카페</a>
                        <a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=12" class="dropdown-item">관광지</a>
                        <a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=15" class="dropdown-item">행사/공연/축제</a>
                        <a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=14" class="dropdown-item">문화시설</a>
                        <a href="tour.list.regional?sigunguCode=0&areaCode=1&ContentTypeId=28" class="dropdown-item">레포츠</a>
                    </div>
                </div>
                <a href="#" class="nav-item nav-link">여행게시판</a>
                <a href="accom.home" class="nav-item nav-link">숙소</a>
                <a href="goto.accomIndex" class="nav-item nav-link">숙소+캠핑</a>
            </div>
            
            <c:if test="${sessionScope.loginMember.m_id eq null && userInfo.nickname eq null}">
            	<a href="goto.login" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Sign in<i class="fa fa-arrow-right ms-3"></i></a>
        	</c:if>
        	
        	<c:if test="${sessionScope.loginMember.m_id ne null}">
				<a class="nav-link disabled my-2 text-light" tabindex="-1" aria-disabled="true">${sessionScope.loginMember.m_name }(${sessionScope.loginMember.m_id })</a>
				<a href="mypage" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">내정보</a>
				<a href="javascript:logout();" class="btn py-4 px-lg-5 d-none d-lg-block" style="background-color: gray;">로그아웃</a>
			</c:if>
			
			<c:if test="${userInfo.nickname ne null }">
				<span class="sr-only">(current)</span>
				<a class="nav-link disabled my-2 text-light" tabindex="-1" aria-disabled="true">${userInfo.nickname }(${userInfo.email })</a>
				<span class="sr-only">(current)</span>
				<button class="btn btn-outline-success my-2 my-sm-0 mb-n1" type="button" onclick="location.href='logout'">로그아웃</button>
			</c:if>
        </div>
    </nav>
    <!-- Navbar End -->

 	<div>
		<jsp:include page="${contentPage }"></jsp:include>
	</div>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/lib/wow/wow.min.js"></script>
    <script src="resources/lib/easing/easing.min.js"></script>
    <script src="resources/lib/waypoints/waypoints.min.js"></script>
    <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>

>>>>>>> f268fa98c2baa3ccdaf46f68c4995110005ff6f9
</body>
</html>