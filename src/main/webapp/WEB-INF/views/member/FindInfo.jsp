<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/FindInformation.css">

<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
function maxLengthCheck(object){
	if (object.value.length > object.maxLength){
		//object.maxLength : 매게변수 오브젝트의 maxlength 속성 값입니다.
		object.value = object.value.slice(0, object.maxLength);
	}    
}
</script>
<script type="text/javascript">
$(function() {
	$('.findID_radio').on('click', function() {
		var IDValue = $('.findID_radio:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
		console.log(IDValue);
		if (IDValue == 'phone') {
			$('.input_findID').attr('type', 'number');
			$('.input_findID').attr('name', 'm_number');
			$('.input_findID').attr('placeholder', 'User Phone Number');
			$('.input_findID').attr('maxlength', '11');
			$('.input_findID').attr('oninput', 'maxLengthCheck(this)');
			$('.input_findID').attr('required', 'required');
			console.log($('.input_findID').val());
		} else if (IDValue == 'email') {
			$('.input_findID').attr('type', 'email');
			$('.input_findID').attr('name', 'm_email');
			$('.input_findID').attr('placeholder', 'User E-Mail');
			$('.input_findID').attr('required', 'required');
		}
	});

	$('.findPW_radio').on('click', function() {
		var PWValue = $('.findPW_radio:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
		if (PWValue == 'phone') {
			$('.input_findPW').attr('type', 'number');
			$('.input_findPW').attr('name', 'm_number');
			$('.input_findPW').attr('placeholder', 'User Phone Number');
			$('.input_findPW').attr('maxlength', '11');
			$('.input_findPW').attr('oninput', 'maxLengthCheck(this)');
			$('.input_findPW').attr('required', 'required');
		} else if (PWValue == 'email') {
			$('.input_findPW').attr('type', 'email');
			$('.input_findPW').attr('name', 'm_email');
			$('.input_findPW').attr('placeholder', 'User E-Mail');
			$('.input_findPW').attr('required', 'required');
		}
	});
})
</script>
</head>
<body>

	<div class="item-wrap">
	<div class="items">
		<div class="item left">
			<div class="inner">
				<form action="find.IDValue" class="find-form" method="post">
					<h2>아이디 찾기</h2>
					<label class="formLabel">회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인하실 수 있습니다.</label>
					<div class="form-radio">
						<label for="idByEmail">
						<input type="radio" id="idByEmail" class="findID_radio" name="findID" value="email" checked="checked">이메일로 찾기</label>
						<label for="idByPhone">
						<input type="radio" id="idByPhone" class="findID_radio" name="findID" value="phone">휴대폰 번호로 찾기</label>
					</div>
					<div class="form-group">
						<input type="text" name="m_name" placeholder="User Name" required>
					</div>
					<div class="form-group">
						<!-- jQuery 사용해서 radio 버튼에 맞게 나오도록 -->
						<input type="email" name="m_email" placeholder="User E-Mail" class="input_findID" required>
					</div>
					<div class="form-group">
						<input type="submit" value="아이디 찾기" id="submit" />
						<input onclick="location.href='goto.login'" type="button" value="로그인" id="login"/>
					</div>
				</form>
			</div>
		</div>

		<div class="item right">
			<div class="inner">
				<form action="find.PWValue" class="find-form" method="post">
					<h2>비밀번호 찾기</h2>
					<label class="formLabel">회원가입 시, 사용하신 아이디 + 이메일 또는 휴대폰 번호로 비밀번호를 확인하실 수
						있습니다.</label>
					<div class="form-radio">
						<label for="pwByEmail">
						<input type="radio" id="pwByEmail" class="findPW_radio" name="findPW" value="email" checked="checked">이메일로 찾기</label>
						<label for="pwByPhone">
						<input type="radio" id="pwByPhone" class="findPW_radio" name="findPW" value="phone">휴대폰 번호로 찾기</label>
					</div>
					<div class="form-group">
						<input type="text" name="m_id" placeholder="UserID" required>
					</div>
					<div class="form-group">
						<!-- jQuery 사용해서 radio 버튼에 맞게 나오도록 -->
						<input type="email" name="m_email" placeholder="User E-Mail" class="input_findPW" required>
					</div>
					<div class="form-group">
						<input type="submit" value="비밀번호 찾기" id="submit"/>
						<input onclick="location.href='goto.login'" type="button" value="로그인" id="login"/>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>


</body>
</html>