<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home.css">
<<<<<<< HEAD
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
=======
>>>>>>> 7c303490097172453487092de220841dc686f535
</head>
<body>

	<!-- 로그인 화면 div -->
<<<<<<< HEAD
	<div
		style="text-align: center; padding-top: 70px; padding-bottom: 50px;">
		<input>
		<button>검색(아이콘)</button>

		<jsp:include page="${loginPage }"></jsp:include>
	</div>

=======
	<div style="text-align: center; padding-top: 70px; padding-bottom: 50px;">
		<input><button>검색(아이콘)</button>
		
		<jsp:include page="${loginPage }"></jsp:include>
	</div>
	
>>>>>>> 7c303490097172453487092de220841dc686f535

	<!-- 네비바 -->
	<div style="width: 5000px;">
		<ul class="navi">
			<li><a href="#">홈</a></li>
			<li><a href="#">여행지</a></li>
			<li><a href="#">여행게시판</a></li>
			<li><a href="#">숙소</a></li>
		</ul>
	</div>
<<<<<<< HEAD

	<a href="board.get.xml">xml</a>

	<input autocomplete="off" placeholder="빠그" id="b1">
	<button id="b1">dz</button>

=======
>>>>>>> 7c303490097172453487092de220841dc686f535
</body>
</html>