<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="currentInfo">
		<tr>
			<td>id</td>
			<td>${sessionScope.loginMember.m_id}</td>
		</tr>

		<tr>
			<td>pw</td>
			<td>${sessionScope.loginMember.m_pw}</td>
		</tr>

		<tr>
			<td>이름</td>
			<td>${sessionScope.loginMember.m_name}</td>
		</tr>

		<tr>
			<td>성별</td>
			<td>${sessionScope.loginMember.m_gender}</td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td>${sessionScope.loginMember.m_number}</td>
		</tr>

		<tr>
			<td>이메일</td>
			<td>${sessionScope.loginMember.m_email}</td>
		</tr>

		<tr>
			<td colspan="3" align="center" onclick="modify();"><button>수정</button></td>
		</tr>
	</table>

	<form action="modifyInfo" method="POST">
		<table id="modifyInfo" style="display: none;">
			<tr>
				<td>id</td>
				<td>${sessionScope.loginMember.m_id}</td>
			</tr>

			<tr>
				<td>pw</td>
				<td><input name="m_pw" value="${sessionScope.loginMember.m_pw}"></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input name="m_name" value="${sessionScope.loginMember.m_name}"></td>
			</tr>

			<tr>
				<td>성별</td>
				<td>${sessionScope.loginMember.m_gender}</td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input name="m_number" value="${sessionScope.loginMember.m_number}"></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><input name="m_email" value="${sessionScope.loginMember.m_email}"></td>
			</tr>

			<tr>
				<td colspan="1" align="center"><button>확인</button></td>
				<td colspan="1" align="center"><button type="button" onclick="modifyCancel();">취소</button></td>
			</tr>
		</table>
	</form>
	
	북마크
	<table>
		<c:forEach var="b" items="${bml }">
			<tr>
				<td>${b.b_title }</td>
				<td><img src="${b.b_image }"style="width: 300px; height: 150px; object-fit: cover;"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>