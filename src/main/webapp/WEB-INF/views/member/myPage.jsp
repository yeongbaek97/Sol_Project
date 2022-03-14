<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		
			<div class="column">
				<div class="mp_profile">
					<div class="profile_title">
						<h2>프로필</h2>
					</div>
					<div class="profile_body">
						<dl>
							<dt>이름</dt>
							<dd>${sessionScope.loginMember.m_name}</dd>
							<dt>성별</dt>
							<dd>${sessionScope.loginMember.m_gender}</dd>
							<dt>휴대전화</dt>
							<dd>${sessionScope.loginMember.m_number}</dd>
							<dt>이메일</dt>
							<dd>${sessionScope.loginMember.m_email}</dd>
						</dl>
					</div>
				</div>


				<div class="mp_tour">
					<div class="profile_title">
						<h2>투어 목록</h2>
					</div>
					
				</div>


			</div>
		
























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


		<table id="modifyInfo" style="display: none;">
			<tr>
				<td>id</td>
				<td>${sessionScope.loginMember.m_id}</td>
			</tr>

			<tr>
				<td>pw</td>
				<td><input id="m_pw" value="${sessionScope.loginMember.m_pw}"></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input id="m_name"
					value="${sessionScope.loginMember.m_name}"></td>
			</tr>

			<tr>
				<td>성별</td>
				<td>${sessionScope.loginMember.m_gender}</td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input id="m_number"
					value="${sessionScope.loginMember.m_number}"></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><input id="m_email"
					value="${sessionScope.loginMember.m_email}"></td>
			</tr>

			<tr>
				<td colspan="1" align="center"><button type="button"
						onclick="modifyInfo();">확인</button></td>
				<td colspan="1" align="center"><button type="button"
						onclick="modifyCancel();">취소</button></td>
			</tr>
		</table>

	</div>
</body>
</html>