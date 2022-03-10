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
<div class="wrap">

<div>
	<img src="resources/img/coffee.jpg" width="100%"height="300px;">

</div>

<div style="margin-top: 100px;margin-left: 10%;margin-right:10%; border-bottom: 1px solid #d8d8d8;">
	<strong style="font-size: 40px;">여행지</strong>
	
<<<<<<< HEAD
	<c:if test="${sessionScope.ContentTypeId ==12 }">
			<p>관광지</p>
	</c:if>
	<c:if test="${sessionScope.ContentTypeId ==14 }">
			<p>문화시설</p>
	</c:if>
	<c:if test="${sessionScope.ContentTypeId ==15 }">
			<p>행사/공연/축제</p>
	</c:if>
	<c:if test="${sessionScope.ContentTypeId ==28 }">
			<p>레포츠</p>
	</c:if>
	<c:if test="${sessionScope.ContentTypeId ==39 }">
			<p>카페</p>
	</c:if>
=======
		<div class="tour_list_view">
			<c:forEach var="c" items="${tourList}" varStatus="status">
				<form id="list${status.index }" action="tour.list.detail?contentid=${c.contentid }" method="post">
					<div style="width: 33%;float: left;" id="dd" onclick="document.forms['list${status.index }'].submit();">
						<img src="${c.firstimage2 }"style="width: 300px; height: 150px; object-fit: cover;"><br>
						${c.title }<br>
						${c.addr1 }
						<input type="hidden" name="x" value="${c.mapx }">
						<input type="hidden" name="y" value="${c.mapy }">
						<input type="hidden" name="title" value="${c.title }">
						<input type="hidden" name="image" value="${c.firstimage2 }">
						<c:choose>
							<c:when test="${ContentTypeId == 12}">
								<input type="hidden" name="contentTypeId" value="관광지">
							</c:when>
							<c:when test="${ContentTypeId == 15}">
								<input type="hidden" name="contentTypeId" value="행사/공연/축제">
							</c:when>
							<c:when test="${ContentTypeId == 14}">
								<input type="hidden" name="contentTypeId" value="문화시설">
							</c:when>
							<c:when test="${ContentTypeId == 28}">
								<input type="hidden" name="contentTypeId" value="레포츠">
							</c:when>
							<c:when test="${ContentTypeId == 39}">
								<input type="hidden" name="contentTypeId" value="카페">
							</c:when>
						</c:choose>
					</div>
				</form>
			</c:forEach>
		</div>
>>>>>>> f268fa98c2baa3ccdaf46f68c4995110005ff6f9
	
</div>



		
<div class="tour_list_view">
	<c:forEach var="c" items="${tourList}" varStatus="status">
		<div>
			<form id="list${status.index }" action="tour.list.detail?contentid=${c.contentid }" method="post">
				<div class="list_item" id="dd" onclick="document.forms['list${status.index }'].submit();">
					<div class="item_img"><img src="${c.firstimage2 }"style="width: 100%; height: 180px; object-fit: cover;"></div>
					
					<div class="item_title">
						<div id="mark_btn"style="float: right; margin-right: 5px;z-index: 4;"><span>★</span></div>
						<div><img src="resources/img/neogul.png" style="position:absolute; width: 100px;height: 80px;left:-50px;top: -18px"></div>
						<div class="list_title">${c.title }</div>
						
						<div class="list_addr">${c.addr1 }</div>
					
						<input type="hidden" id="check_mapy" name="y" value="${c.mapy }">
						<input type="hidden" class="title" name="title" value="${c.title }">
						<input type="hidden" id="check_contentid"name="image" value="${c.firstimage2 }">
					</div>		
				</div>
			</form>
		</div>
	</c:forEach>
</div>	

<!-- 지역선택 Type2 -->
	<aside id="sidebar" class="tour_list_select_wrap">
	<button><span class="btn_t">지역 필터</span></button>
		<div class="tour_list_select">
		<input id="areaCode" type="hidden" value="${areaCode }">
			<ul class="code_item_list">
				<li class="area_select" id="1">서울</li>
				<li class="area_select" id="2">인천</li>
				<li class="area_select" id="3">대전</li>
				<li class="area_select" id="4">대구</li>
			
				<li class="area_select" id="5">광주</li>
				<li class="area_select" id="6">부산</li>
				<li class="area_select" id="7">울산</li>
				<li class="area_select" id="8">세종</li>
			
				<li class="area_select" id="31">경기</li>
				<li class="area_select" id="32">강원</li>
				<li class="area_select" id="33">충북</li>
				<li class="area_select" id="34">충남</li>
			
				<li class="area_select" id="35">경북</li>
				<li class="area_select" id="36">경남</li>
				<li class="area_select" id="37">전북</li>
				<li class="area_select" id="38">전남</li>
			
				<li class="area_select" id="39">제주</li>
			</ul>
		</div>


		<div class="Gu_office" id="Gu_office">
			<ul id="gu_ul">
				<li class="gu_select" id="0">전체</li>
			</ul>
			
		</div>
	</aside>


	
	<!-- 페이징 부분 뷰는 추후에 작업예정 -->
	<div>
		<c:if test="${curPage != 1 }">
			<a href="tour.list.regional_change?p=${curPage - 1 }">이전</a>
		</c:if>
		<c:if test="${curPage != pageCount }">
			<a href="tour.list.regional_change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>

</div>
</body>
</html>