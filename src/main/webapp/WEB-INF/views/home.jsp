<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home.css">
<script type="text/javascript" src="resources/jQuery.js"></script>
<script>
	$(function() {
		
		$("#b1").keyup(function(){
			let inputVal = $("#b1").val();			
		
			$.ajax({
				type : "GET",
				url : "http://api.visitkorea.or.kr/openapi/service/rest/DataLabService",
				data : {
					"b_name" : inputVal
				},
				dataType : 'xml',
				success : function(data) {
					console.log(data)
				}
			})
		})
	})
</script>
</head>
<body>

	<!-- 로그인 화면 div -->
	<div
		style="text-align: center; padding-top: 70px; padding-bottom: 50px;">
		<input>
		<button>검색(아이콘)</button>

		<jsp:include page="${loginPage }"></jsp:include>
	</div>


	<!-- 네비바 -->
	<div style="width: 5000px;">
		<ul class="navi">
			<li><a href="#">홈</a></li>
			<li><a href="#">여행지</a></li>
			<li><a href="#">여행게시판</a></li>
			<li><a href="#">숙소</a></li>
		</ul>
	</div>

	<a href="board.get.xml">xml</a>

	<input autocomplete="off" placeholder="빠그" id="b1">
	<button id="b1">dz</button>

</body>
</html>