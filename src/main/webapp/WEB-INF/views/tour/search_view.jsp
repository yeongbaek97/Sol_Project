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
			<img src="resources/img/coffee.jpg" width="100%" height="250px;">

		</div>

		<div
			style="margin-top: 150px; margin-left: 10%; margin-right: 10%; border-bottom: 1px solid #d8d8d8;">
			<strong style="font-size: 40px;">여행지</strong>

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




								<%-- <input type="hidden"  id="contentTypeId" name="contentTypeId" value="${ContentTypeId }"> --%>
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
								<input type="hidden" class="check_mapx" name="x" value="${c.mapx }">
								<input type="hidden" class="check_mapy" name="y" value="${c.mapy }">
								<input type="hidden" class="check_title" name="title" value="${c.title }">
								<input type="hidden" class="check_contentid" name="contentid" value="${c.contentid }">
								<input type="hidden" class="check_image" name="image" value="${c.firstimage2 }">

							</div>
						</div>
					</form>
				</div>
			</c:forEach>
		</div>

		
		



		<!-- 페이징 부분 뷰는 추후에 작업예정 -->
		<div align="center">
			<c:if test="${curPage != 1 }">
				<a href="tour.list.search_change?p=${curPage - 1 }">이전</a>
			</c:if>
			<c:if test="${curPage != pageCount }">
				<a href="tour.list.search_change?p=${curPage + 1 }">다음</a>
			</c:if>
		</div>

	</div>
</body>
</html>