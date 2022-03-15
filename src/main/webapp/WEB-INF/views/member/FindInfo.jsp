<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
$(function() {
	$('.findID_radio').on('click', function() {
	    var IDValue = $('.findID_radio:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
	    console.log(IDValue);
	    if(IDValue=='phone'){
	    	$('.input_findID').attr('type', 'number'); 
	    	$('.input_findID').attr('name', 'm_number'); 
	    	$('.input_findID').attr('placeholder', 'User Phone Number'); 
	    } else if(IDValue=='email'){
	    	$('.input_findID').attr('type', 'email'); 
	    	$('.input_findID').attr('name', 'm_email'); 
	    	$('.input_findID').attr('placeholder', 'User E-Mail');
	    }
	});
	
	$('.findPW_radio').on('click', function() {
	    var PWValue = $('.findPW_radio:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
	    if(PWValue=='phone'){
	    	$('.input_findPW').attr('type', 'number'); 
	    	$('.input_findPW').attr('name', 'm_number'); 
	    	$('.input_findPW').attr('placeholder', 'User Phone Number');
	    } else if(PWValue=='email') {
	    	$('.input_findPW').attr('type', 'email'); 
	    	$('.input_findPW').attr('name', 'm_email'); 
	    	$('.input_findPW').attr('placeholder', 'User E-Mail');
	    }
	});
})
</script>
<link rel="stylesheet" href="resources/css/FindInfo.css">
</head>
<body>

	<div class="find-container">
		<div class="find-content">
			<form action="find.IDValue" class="findID-form" method="post">
			<h2>아이디 찾기</h2>
				<label>회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인하실 수 있습니다.</label>
				<div class="form-radio">
					<input type="radio" class="findID_radio" name="findID" value="email" checked="checked"> 이메일로 찾기
					<input type="radio" class="findID_radio" name="findID" value="phone"> 휴대폰 번호로 찾기
				</div>
				<div class="form-group">
					<input type="text" name="m_name" placeholder="User Name">
				</div>
				<div class="form-group">
					<!-- jQuery 사용해서 radio 버튼에 맞게 나오도록 -->
					<input type="email" name="m_email" placeholder="User E-Mail" class="input_findID">
				</div>
				<div class="form-group">
					<input type="submit" value="아이디 찾기"/>
					<input onclick="location.href='goto.login'" type="button" value="로그인"/>
				</div>
			</form>
		</div>
		
		<div class="find-content">
			<form action="find.PWValue" class="findPW-form" method="post">
			<h2>비밀번호 찾기</h2>
				<label>회원가입 시, 사용하신 아이디 + 이메일 또는 휴대폰 번호로 비밀번호를 확인하실 수 있습니다.</label>
				<div class="form-radio">
					<input type="radio" class="findPW_radio" name="findPW" value="email" checked="checked"> 이메일로 찾기
					<input type="radio" class="findPW_radio" name="findPW" value="phone"> 휴대폰 번호로 찾기
				</div>
				<div class="form-group">
					<input type="text" name="m_id" placeholder="UserID">
				</div>
				<div class="form-group">
					<!-- jQuery 사용해서 radio 버튼에 맞게 나오도록 -->
					<input type="email" name="m_email" placeholder="User E-Mail" class="input_findPW">
				</div>
				<div class="form-group">
					<input type="submit" value="비밀번호 찾기"/>
					<input onclick="location.href='goto.login'" type="button" value="로그인"/>
				</div>
			</form>
		</div>
	</div>

</body>
</html>