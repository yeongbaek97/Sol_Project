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
<script type="text/javascript" src="resources/js/kakaoMap.js"></script>
<script type="text/javascript" src="resources/js/tourapi.js"></script>

<script type="text/javascript" src="resources/js/home.js"></script>
<script type="text/javascript" src="resources/js/move.js"></script>
<script type="text/javascript" src="resources/js/myPage.js"></script>
<script type="text/javascript" src="resources/js/loginmain.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9e56e3f8a09664081781aefaf8493c0&libraries=services"></script>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/accom.css">
<link rel="stylesheet" href="resources/css/tour.css">
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/kakaoMap.css">
<link rel="stylesheet" href="resources/css/mypage.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/abbb1ab547.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

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
	<input id="check_id" type="hidden" value="${sessionScope.loginMember.m_id}">

	
	<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0" style="position: fixed; width: 100%;">
        <a href="goto.Index" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">TourGether</h2>
        </a>
        
        <div class="position-relative mx-auto">
            <input style="width: 300px;" class="form-control border-1 py-3 ps-4 pe-5" id="word" type="text" placeholder="검색어 입력" onkeypress="if(event.keyCode==13){searchEnter();}" onclick="wordVisible();" autocomplete="off">
            <button type="button" style="margin-top: 10px;" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2" onclick="searchEnter();">Search</button>
        
        	<div class="form-control" id="searchWord" style="background-color:white; border-style: ridge; border-width: 1px; border-color: black; position: absolute; visibility: hidden; margin-top: 10px;">
			<table style="width: 100%">
				<c:forEach  var="srl" items="${searchRankList }" varStatus="status">
					<c:if test="${status.index + 1 <= 5 }">
						<tr style="color: #${status.index + 3}${status.index + 5}${status.index + 3}${status.index + 5}${status.index + 3}${status.index + 5}">
							<td align="center" style="width: 30%;"><i class="fa-solid fa-${status.index + 1 }" style="font-size: 20px;"></i></td>
							<td align="center" style="width: 70%; font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 20px; padding-bottom: 7px;">${srl.word}</td>
						</tr>
					</c:if>
		        </c:forEach>
			</table>
			</div>
        </div>
        
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
                <a href="goto.board?curPage=1" class="nav-item nav-link">여행게시판</a>
                <a href="goto.accom" class="nav-item nav-link">숙소</a>
                
            </div>
            
            <c:if test="${sessionScope.loginMember.m_id eq null && userInfo.nickname eq null}">
            	<a href="goto.login" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Sign in<i class="fa fa-arrow-right ms-3"></i></a>
        	</c:if>
        	
        	<c:if test="${sessionScope.loginMember.m_id ne null}">
				<a class="nav-link disabled my-2 text-light" tabindex="-1" aria-disabled="true">${sessionScope.loginMember.m_name }(${sessionScope.loginMember.m_id })</a>
				<a href="mypage?b_id=${sessionScope.loginMember.m_id }" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">내정보</a>
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

 	<div style="margin-top: 75px;">
		<jsp:include page="${contentPage }"></jsp:include>
	</div>
	
	<!-- Footer Start -->
    <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3">Quick Link</h4>
                    <a class="btn btn-link" href="">About Us</a>
                    <a class="btn btn-link" href="">Contact Us</a>
                    <a class="btn btn-link" href="">Privacy Policy</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="">FAQs & Help</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3">Contact</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3">Gallery</h4>
                    <div class="row g-2 pt-2">
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="resources/img/course-1.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="resources/img/course-2.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="resources/img/course-3.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="resources/img/course-2.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="resources/img/course-3.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="resources/img/course-1.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3">Newsletter</h4>
                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved.

                        <!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br>
                        Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-menu">
                            <a href="">Home</a>
                            <a href="">Cookies</a>
                            <a href="">Help</a>
                            <a href="">FQAs</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->

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

</body>
</html>