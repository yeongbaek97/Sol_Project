<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<table id="TitleTbl">
				<tr>
					<td class="title-img"> <p align="right"><img src="resources/img/checkedPW.png"> </td>
					<td class="title-letter"> <h2>비밀번호 찾기</h2> </td>
				</tr>
			</table>
		</div>
		<div class="LabelOfFind">
			<label>비밀번호 찾기가 완료되었습니다.</label>
		</div>
		
		<div class="ResultContent">
			<div class="ResultLabelInfo1">찾으시는 비밀번호는</div>
			<div class="ResultLabel">${pw }</div>
			<div class="ResultLabelInfo2">입니다.</div>
		</div>
		
		
			<button id="findBtn" onclick="location.href='findInfo.login'">ID/PW 찾기</button>
			<button id="resultBtn" onclick="location.href='goto.login'">로그인 하러 가기</button>
		</div>
	</div>

</body>
</html>