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
<<<<<<< HEAD
			<img src="resources/img/water2.jpg" width="100%" height="300px;">
=======
			<img src="resources/img/pimage2.jpg" width="100%" height="300px;">
>>>>>>> 978daadd1594cca6a8a3f327ea755038e1e0b28c

		</div>

		<div
			style="margin-top: 100px; margin-left: 10%; margin-right: 10%; border-bottom: 1px solid #d8d8d8;">
			<strong style="font-size: 40px;">여행지</strong>

		</div>
		<div class="tour_list_view">
			<c:forEach var="c" items="${tourList}" varStatus="status">
				<div>
					<form id="list${status.index }" action="tour.list.detail"
						method="post">
						<div class="list_item" id="dd"
							onclick="document.forms['list${status.index }'].submit();">
							<div class="item_img">
								<img src="${c.firstimage2 }"
									style="width: 100%; height: 180px; object-fit: cover;">
							</div>

							<div class="item_title check_attr">
								<div class="mark_btn"
									style="float: right; margin-right: 5px; z-index: 4;">
									<span>★</span>
								</div>

								<div>
									<img src="resources/img/neogul.png"
										style="position: absolute; width: 100px; height: 80px; left: -50px; top: -18px">
								</div>
								<div class="list_title">${c.title }</div>

								<div class="list_addr">${c.addr1 }</div>




								<input type="hidden" id="contentTypeId" name="contentTypeId" value="${ContentTypeId }">
								
								<input type="hidden" class="check_mapx" name="x" value="${c.mapx }">
								<input type="hidden" class="check_mapy" name="y" value="${c.mapy }">
								<input type="hidden" class="check_title" name="title" value="${c.title }">
								<input type="hidden" class="check_contentid" name="contentid" value="${c.contentid }">
								<input type="hidden" class="check_image" name="image" value="${c.firstimage2 }">
								<input type="hidden" class="check_addr1" name="addr1" value="${c.addr1 }">

							</div>
						</div>
					</form>
				</div>
			</c:forEach>
		</div>

		<!-- 지역선택 Type2 -->
		<aside id="sidebar" class="tour_list_select_wrap">
			<button>
				<span class="btn_t">지역 필터</span>
			</button>
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



		
		<div align="center" style="margin-bottom: 50px;">
		
		<c:if test="${curPage gt 10 }">
			<a href="tour.list.regional_change?p=${(pageGroup-1)*10 -9}">◀ &nbsp;&nbsp;&nbsp;</a>
		</c:if>
		
		
		<c:if test="${endPage lt pageCount }">
			<c:forEach begin="${startPage }" end="${endPage }" varStatus="status">
				<a href="tour.list.regional_change?p=${startPage-1 + status.count }">${startPage-1 + status.count } &nbsp;&nbsp;&nbsp;</a>
			</c:forEach>
		</c:if>
		
		<c:if test="${endPage ge pageCount }">
			<c:forEach begin="${startPage }" end="${pageCount }" varStatus="status">
				<a href="tour.list.regional_change?p=${startPage-1 + status.count }">${startPage-1 + status.count } &nbsp;&nbsp;&nbsp;</a>
			</c:forEach>
		</c:if>
				
		<c:if test="${pageGroup*10 lt pageCount }">
			<a href="tour.list.regional_change?p=${pageGroup*10 +1 }">▶</a>
		</c:if>
		
		</div>
		
	
		
		
		
		
		
		
	

	</div>
</body>
</html>