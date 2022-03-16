<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/FindResult.css">
</head>
<body>

	<div class="FindResult">
		<div class="ResultCard">
			<div class="title">
				<div class="title-img">
					<img src="resources/img/checkedID.png">
				</div>
				<div class="title-letter">
					<h2>아이디 찾기</h2>
				</div>
			</div>
			<div class="LabelOfFind">
				<label>아이디 찾기가 완료되었습니다.</label>
			</div>
			<div class="ResultContent">
				<label id="idResultLabel">${id }</label>
				<button id="findBtn" onclick="location.href='findInfo.login'">ID/PW 찾기</button>
				<button id="resultBtn" onclick="location.href='goto.login'">로그인 하러 가기</button>
			</div>
		</div>
	</div>

</body>
</html>