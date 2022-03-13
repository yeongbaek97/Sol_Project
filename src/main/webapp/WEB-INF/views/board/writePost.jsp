<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="writePostForm" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td colspan="2"><input name="b_title" id="b_title" style="width: 500px;"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="b_content" id="b_content" style="width: 500px; height: 300px;"></textarea></td>
			</tr>
			<tr>
				<td>사진 추가</td>
				<td><input name="b_image" id="b_image" type="file"></td>
			</tr>
			<tr>
				<td><button type="button" onclick="writePost();">작성</button></td>
				<td><button type="button" onclick="location.href='goto.board'">취소</button></td>
			</tr>
		</table>
		<input type="hidden" name="b_writer" id="b_writer" value="${sessionScope.loginMember.m_id}">
	</form>

</body>
</html>