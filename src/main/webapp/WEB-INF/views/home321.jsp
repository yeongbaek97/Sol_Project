<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/kakaoMap.js"></script>
<script type="text/javascript" src="resources/js/tourapi.js"></script>
<script type="text/javascript" src="resources/js/home.js"></script>
<script type="text/javascript" src="resources/js/move.js"></script>
<script type="text/javascript" src="resources/js/myPage.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9e56e3f8a09664081781aefaf8493c0&libraries=services"></script>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/accom.css">
<link rel="stylesheet" href="resources/css/tour.css">
<link rel="stylesheet" href="resources/css/kakaoMap.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<input id="check_id" type="hidden" value="${sessionScope.loginMember.m_id}">
<input id="check_mapx" type="hidden" value="${tourdetailcommon.mapx }">
<input id="check_mapy" type="hidden" value="${tourdetailcommon.mapy }">
<input id="check_contentid" type="hidden" value="${tourdetail.contentid }">
<input id="check_title" type="hidden" value="${tourdetailcommon.title }">


	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
		<a class="navbar-brand text-light text-weight-bold px-5" href="goto.Index">Tour</a>
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

</body>
</html>