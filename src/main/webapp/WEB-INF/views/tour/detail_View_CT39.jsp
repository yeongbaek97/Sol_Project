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

<button id="mark_btn">즐겨찾기</button>
<input id="check_image" type="hidden" value="${param.image }">
	<div class="wrap" align="center">

		<div align="center" style=" width:70%; margin-top:100px;margin-bottom:100px; border-bottom: 1px solid;">
	
			<div>
			<h1 >${tourdetailcommon.title}</h1>
			
			</div>
			
			
		</div>

		 <!-- 
	    <div class="container-fluid" style="height: 400px; width: 600px; margin-bottom: 20px;">
	        <div class="owl-carousel header-carousel " style="bottom: 50px;">
	        	<c:forEach var="c" items="${originimgurl}">
		            <div class="owl-carousel-item">
		            	<img src="${c }" style="height: 400px; width: 600px;">
		            </div>
	            </c:forEach>
	        </div>
	    </div>
 		-->

		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="false" style="width: 600px; height: 400px; top: -50px;">
			
			<div class="carousel-indicators">
				<c:forEach var="c" items="${originimgurl}" end="0" varStatus="status">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				</c:forEach>
				<c:forEach var="c" items="${originimgurl}" begin="1" varStatus="status">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index }" aria-label="Slide ${status.index + 1 }"></button>
				</c:forEach>			
			</div>
			
			<div class="carousel-inner">
				<c:forEach var="c" items="${originimgurl}" end="0" varStatus="status">
					<div class="carousel-item active">
						<img src="${c }" class="d-block w-100" alt="..." style="width: 600px; height: 400px;">
					</div>
				</c:forEach>
				<c:forEach var="c" items="${originimgurl}" begin="1" varStatus="status">
					<div class="carousel-item">
						<img src="${c }" class="d-block w-100" alt="..." style="width: 600px; height: 400px;">
					</div>
				</c:forEach>
				
			</div>
			
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<div style="margin-bottom: 50px; width: 60%;">
			${tourdetailcommon.overview}
		</div>

		<div style="margin-top:40px;margin-left: 20%;border-bottom: 1px solid;" align="left">
		
		
			전화번호 : ${tourdetailcommon.tel}<br>
			
			오픈시간 : ${tourdetail.opentimefood } <br>
			대표메뉴 : ${tourdetail.firstmenu }<br>
			휴무일 : ${tourdetail.restdatefood }<br>

			
			포장 : ${tourdetail.packing } <br>
			주차 : ${tourdetail.parkingfood } <br>


			
			메뉴 : ${tourdetail.treatmenu } <br>
			

		</div>
		
		<div>
		<section>
			<jsp:include page="${kakaoMap }"></jsp:include>
		</section>
		${tourdetailcommon.addr1}<br>
			${tourdetailcommon.addr2}<br>
		</div>




	</div>

	
</body>
</html>