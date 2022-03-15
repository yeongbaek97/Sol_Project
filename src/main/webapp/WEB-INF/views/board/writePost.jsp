<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-left:10%;margin-right:10%; margin-top: 198px;padding: 50px;border-bottom:1px solid #d8d8d8;">
		<h1> 글 작성 </h1>
	</div>
	
	<div align="center" style="margin-left: 10%;margin-right: 10%;padding: 20px 50px 50px 50px;">
		<form id="writePostForm" method="post" enctype="multipart/form-data">
			<table style="width: 800px;">
				<tr>
					<td style="width: 100px;">제목 : </td>
					<td><input name="b_title" id="b_title" style="width: 730px; height: 40px;"></td>
				</tr>
				<tr><td style="height:20px;"></td></tr>
				<tr>
					<td colspan="2"><textarea name="b_content" id="b_content" style="width: 800px; height: 300px;"></textarea></td>
				</tr>
				<tr>
					<td style="width: 100px;;">사진 추가</td>
					<td style=""><input name="b_image" id="b_image" type="file"></td>
				</tr>
					
			</table>
			
			<div style="padding-top: 50px;">
				<button class="btn btn-primary" style="margin-right: 10px;" type="button" onclick="writePost();">작성</button>
				<button class="btn btn-outline-secondary" style="margin-left: 10px;" type="button" onclick="location.href='goto.board'">취소</button>
			</div>
			<input type="hidden" name="b_writer" id="b_writer" value="${sessionScope.loginMember.m_id}">
		</form>
	</div>
</body>
</html>