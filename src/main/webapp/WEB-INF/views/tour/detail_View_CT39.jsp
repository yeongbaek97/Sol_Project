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
	<div>

		<div>

			<h1 style="">${tourdetailcommon.title}</h1>

			${tourdetailcommon.addr1}<br>
			${tourdetailcommon.addr2}<br>
			${tourdetailcommon.overview}<br>

		</div>


		<div>
			<c:forEach var="c" items="${originimgurl}">
				<img src="${c }" width="350px" height="200px">
			</c:forEach>
		</div>

		<div>
		<section>
			<jsp:include page="${kakaoMap }"></jsp:include>
		</section>
			전화번호 : ${tourdetailcommon.tel}<br>
			
			오픈시간 : ${tourdetail.opentimefood } <br>
			대표메뉴 : ${tourdetail.firstmenu }<br>
			휴무일 : ${tourdetail.restdatefood }<br>

			
			포장 : ${tourdetail.packing } <br>
			주차 : ${tourdetail.parkingfood } <br>


			
			메뉴 : ${tourdetail.treatmenu } <br>
			

		</div>




	</div>

	
</body>
</html>