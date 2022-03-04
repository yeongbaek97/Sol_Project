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

<!--if 세선.id == book 테이블 id + 디테일 페이지 con_id == book con id  
	버튼 다른색
	
	버튼 클릭 -> map x,y id .... 테이블 저장
	버튼 해제 -> 저장된 값 제거
-->
<button id="mark_btn">즐겨찾기</button>
<input id="check_image" type="hidden" value="${param.image }">


${tourdetail.parking }
${tourdetail.chkpet }
${tourdetail.infocenter }
${tourdetail.restdate }
${tourdetail.usetime }
${tourdetail.expguide }
${tourdetail.expagerange }
${tourdetail.chkbabycarriage }
<hr>
<c:forEach var="c" items="${tourdetail2}">
	${c.infoname }
	${c.infotext }	
</c:forEach>
<hr>

<div>
			<c:forEach var="c" items="${originimgurl}">
				<img src="${c }" width="350px" height="200px">
			</c:forEach>
		</div>


<div>
등록일 : ${tourdetailcommon.createdtime }
전화번호 : ${tourdetailcommon.tel }
</div>

<jsp:include page="${kakaoMap }"></jsp:include>
</body>
</html>