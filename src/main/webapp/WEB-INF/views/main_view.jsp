<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/js/move.js"></script>
</head>
<body>
 	<!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5">
        <div class="owl-carousel header-carousel position-relative">
            <div class="owl-carousel-item position-relative">
                <img class="img-fluid" src="resources/img/homeImage/mainImg.jpg" alt="">
                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-sm-10 col-lg-8">
                                <h1 class="display-3 text-white animated slideInDown">See You in SEOUL</h1>
                                <p class="fs-5 text-white mb-4 pb-2">서울에서 만나요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="owl-carousel-item position-relative">
                <img class="img-fluid" src="resources/img/homeImage/seoul.jpg" alt="">
                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-sm-10 col-lg-8">
                                <h1 class="display-3 text-white animated slideInDown">See You in SEOUL</h1>
                                <p class="fs-5 text-white mb-4 pb-2">서울에서 만나요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-plane text-primary mb-4"></i>
                            <h5 class="mb-3">여행지</h5>
                            <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-globe text-primary mb-4"></i>
                            <h5 class="mb-3">여행 게시판</h5>
                            <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-home text-primary mb-4"></i>
                            <h5 class="mb-3">숙소</h5>
                            <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-hotel text-primary mb-4"></i>
                            <h5 class="mb-3">숙소+캠핑</h5>
                            <p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed clita amet diam</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->

    <!-- Courses Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">인기 여행지</h6>
                <h1 class="mb-5">TOP 6</h1>
            </div>
            <div class="row g-4 justify-content-center">
            	<c:forEach  var="trl" items="${tourRankList }" varStatus="status">
            		<c:if test="${status.index + 1 <= 6 }">
	                <form id="list${status.index }" action="tour.list.detail" method="post" style="width: 33%;">						
		                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="${(status.index + 1) * 0.1}s" style="width: 100%">
		                    <div class="course-item bg-light">
		                        <div class="position-relative overflow-hidden">
		                            <img onclick="document.forms['list${status.index }'].submit();" class="img-fluid" src="${trl.image }" alt="" style="width: 400px; height: 300px; object-fit: cover;">
		                        </div>
		                        <div class="text-center p-4 pb-0">
		                            <h3 class="mb-0">${trl.title }</h3>
		                            <div class="mb-3">
		                                <small>${trl.contentTypeId }</small>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                
		                <input type="hidden" name="contentid" value="${trl.contentid }">
		                <input type="hidden" name="contentTypeId" id="contentTypeId" value="${trl.contentTypeId }">
		                <input type="hidden" id="check_mapx" name="x" value="${trl.x }">
		                <input type="hidden" id="check_mapy" name="y" value="${trl.y }">
						<input type="hidden" class="title" name="title" value="${trl.title }">
						<input type="hidden" id="check_contentid" name="image" value="${trl.image }">
		                
	                	</form>
	                </c:if>
	           	</c:forEach>
                
            </div>
        </div>
    </div>
    <!-- Courses End -->
       
	
   

</body>
</html>