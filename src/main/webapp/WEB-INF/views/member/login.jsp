<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<form action="login" method="post">
	<table>
		<tr>
			<td align="center"><input name="m_id" placeholder="ID"
				maxlength="15" autocomplete="off"></td>
		</tr>
		<tr>
			<td align="center"><input name="m_pw" placeholder="PW" maxlength="15"
				autocomplete="off" type="password"></td>
		</tr>
		<tr>
			<td align="center"><button>로그인</button> &nbsp;&nbsp; <button type="button" onclick="goJoin()">회원가입</button></td>
		</tr>
		
		<tr>
			<td>
				<!-- 카카오로그인-->
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=500a463927b5af4c4a3224e8a14e8ace&redirect_uri=http://localhost/pj/kakao.login&response_type=code">
				<img src="resources/img/kakao_login_medium_narrow.png">
				</a>
			</td>
		</tr>
		
	</table>
	</form>

</body>
</html>