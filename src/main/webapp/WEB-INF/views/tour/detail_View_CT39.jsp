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


		<div style="margin-top: 80px; margin-bottom: 70px;">
			<c:forEach var="c" items="${originimgurl}">
				<img src="${c }" width="350px" height="200px">
			</c:forEach>
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