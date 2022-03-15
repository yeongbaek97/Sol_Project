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

<div class="wrap" align="center">

		<div class="detail_title_warp" align="center">



			<div class="detail_title check_attr">
				<h1>${tourdetailcommon.title}</h1>
				<span class="mark_btn">★</span> <input type="hidden"
					class="check_mapx" value="${tourdetailcommon.mapx }"> <input
					type="hidden" class="check_mapy" value="${tourdetailcommon.mapy }">
				<input type="hidden" class="check_contentid"
					value="${tourdetail.contentid }"> <input type="hidden"
					class="check_title" value="${tourdetailcommon.title }"> <input
					type="hidden" class="check_image" value="${param.image }">
				<input type="hidden" class="check_addr1" value="${tourdetailcommon.addr1}">
				<input type="hidden" id="contentTypeId" value="${sessionScope.ContentTypeId}">
			</div>


		</div>


		<div class="detail_body_warp">



			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel" data-bs-interval="false"
				style="width: 600px; height: 400px; top: -50px;">

				<div class="carousel-indicators">
					<c:forEach var="c" items="${originimgurl}" end="0"
						varStatus="status">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
					</c:forEach>
					<c:forEach var="c" items="${originimgurl}" begin="1"
						varStatus="status">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="${status.index }"
							aria-label="Slide ${status.index + 1 }"></button>
					</c:forEach>
				</div>

				<div class="carousel-inner">
					<c:forEach var="c" items="${originimgurl}" end="0"
						varStatus="status">
						<div class="carousel-item active">
							<img src="${c }" class="d-block w-100" alt="..."
								style="width: 600px; height: 400px;">
						</div>
					</c:forEach>
					<c:forEach var="c" items="${originimgurl}" begin="1"
						varStatus="status">
						<div class="carousel-item">
							<img src="${c }" class="d-block w-100" alt="..."
								style="width: 600px; height: 400px;">
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

			<div style="margin-bottom: 80px; width: 80%;text-align:left; font-size: 18px; font-family: 'Noto Sans Korean'">
				${tourdetailcommon.overview}
			</div>

			<div class="detail_info" align="left">




				<div class="detail_info_item">
					<div>
						<strong>이용시간</strong>
					</div>
					<div class="detail_info_item_value">${tourdetail.usetimeculture }</div>
				</div>
				<div class="detail_info_item">
					<div>
						<strong>관람 소요시간</strong>
					</div>
					<div class="detail_info_item_value">${tourdetail.spendtime }</div>
				</div>
				<div class="detail_info_item">
					<div>
						<strong>쉬는날</strong>
					</div>
					<div class="detail_info_item_value">${tourdetail.restdateculture }</div>
				</div>
				<div class="detail_info_item">
					<div>
						<strong>주차시설</strong>
					</div>
					<div class="detail_info_item_value">${tourdetail.parkingculture }</div>
				</div>
				<div class="detail_info_item">
					<div>
						<strong>애완동물동반</strong>
					</div>
					<div class="detail_info_item_value">${tourdetail.chkpetculture }</div>
				</div>
				<div class="detail_info_item">
					<div>
						<strong>유모차대여</strong>
					</div>
					<div class="detail_info_item_value"> ${tourdetail.chkbabycarriageculture }</div>
				</div>
				<div class="detail_info_item">
					<div>
						<strong>이용요금</strong>
					</div>
					<div class="detail_info_item_value">${tourdetail.usefee}</div>
				</div>
				<div class="detail_info_item">
					<div>
						<strong>문의 및 안내</strong>
					</div>
					<div class="detail_info_item_value">${tourdetail.infocenterculture}</div>
				</div>

			</div>



		</div>
		
		
		
		<div>
			<section>
				<jsp:include page="${kakaoMap }"></jsp:include>
			</section>
			${tourdetailcommon.addr1}<br>
		</div>




	</div>

</body>
</html>