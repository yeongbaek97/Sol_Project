<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>

		<div>
			문의 : ${tourdetail.infocenterfood } <br>
			오픈시간 : ${tourdetail.opentimefood } <br>
			대표메뉴 : ${tourdetail.firstmenu }<br>
			휴무일 : ${tourdetail.restdatefood } <br>

			
		</div>


		

</div>

<jsp:include page="${kakaoMap }"></jsp:include>
</body>
</html>