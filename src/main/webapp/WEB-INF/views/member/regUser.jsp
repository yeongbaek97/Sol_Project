<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="resources/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="resources/vendor/jquery-ui/jquery-ui.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="resources/css/regUser.css">
    
    <!-- JS -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/jquery-ui/jquery-ui.min.js"></script>
    <script src="resources/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="resources/vendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="resources/js/regUser.js"></script>
    
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
	
	$("#inputID").keyup(function() {
		let inputVal = $("#inputID").val();
		var cnt;
		
		$.ajax({
			url : "checkID.value",
			type : "POST",
			dataType : 'json',
			data : {"m_id" : inputVal},
			success : function(data) {
				console.log('data: ' + data);
				cnt = data;
				console.log('cnt: ' + cnt);
				if(cnt != 1){ // cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
					$('#idCheck').text("사용 가능한 아이디입니다.");
					$('#idCheck').css("color", "#1da0f2");
	               } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                   $('#inputID').attr("class", "form-input error");
	               	$('#inputID').attr("aria-invalid", "true");
	                   $('#idCheck').text("이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
	                   $('#idCheck').css("color","#C70000");
	                   $(':input[type="submit"]').prop('disabled', true);
	               }
			}
		})
	})
	
	$("#inputEmail").keyup(function() {
		let inputVal = $("#inputEmail").val();
		
		$.ajax({
			url : "checkEmail.value",
			type : "POST",
			dataType : 'json',
			data : {"m_email" : inputVal},
			success : function(data) {
				console.log(data);
				if(data != 1){ // data가 1이 아니면(=0일 경우) -> 사용 가능한 이메일
					$('#emailCheck').text("사용 가능한 이메일입니다.");
					$('#emailCheck').css("color", "#1da0f2");
				} else { // data가 1일 경우 -> 이미 존재하는 이메일
					$('#inputEmail').attr("class", "form-input error");
					$('#inputEmail').attr("aria-invalid", "true");
					$('#emailCheck').text("이 이메일로 가입한 아이디가 있습니다. 다른 이메일을 사용해주세요.");
					$('#emailCheck').css("color","#C70000");
					$(':input[type="submit"]').prop('disabled', true);
				}
			}
		})
	})
	
})
</script>
</head>
<body>
	
	<div class="main">
		<section class="signup">
			<!-- <img src="images/signup-bg.jpg" alt=""> -->
			<div class="container">
				<div class="signup-content">
					<form action="goto.RegUser" method="POST" id="signup-form" class="signup-form">
						<div class="form-group">
							<label for="first_name">Name</label>
							<input type="text" class="form-input" name="m_name" id="first_name" maxlength="10"/>
						</div>
						
						<div class="form-group">
							<label for="last_name">ID</label>
							<input type="text" class="form-input" name="m_id" id="inputID" maxlength="10"/>
							<label id="idCheck" for="validate"></label>
						</div>
						
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" class="form-input" name="m_email" id="inputEmail" />
							<label id="emailCheck" for="validate"></label>
						</div>
						
						<div class="form-group">
							<label for="password">Password</label>
							<input type="password" class="form-input" name="m_pw" id="password"/>
						</div>
						
						<div class="form-group">
							<label for="re_password">Repeat your password</label>
							<input type="password" class="form-input" name="re_password" id="re_password"/>
						</div>
						
						<div class="form-row">
							<div class="form-group">
							<label for="phone_number">Phone number</label>
							<input type="number" class="form-input" name="m_number" id="phone_number" maxlength="11" oninput="maxLengthCheck(this)"/>
							</div>
							<div class="form-radio">
								<label for="gender">Gender</label>
								<div class="form-flex">
									<input type="radio" name="m_gender" value="male" id="male" checked="checked" />
									<label for="male">Male</label>
    
									<input type="radio" name="m_gender" value="female" id="female" />
									<label for="female">Female</label>
								</div>
							</div>
						</div>
						
						
						<div class="form-text">
							<a href="#" class="add-info-link"><i class="zmdi zmdi-chevron-right"></i>Additional info</a>
							<div class="add_info">
								<div class="form-group form-icon">
								<label for="birth_date">Birth date</label>
								<input type="text" class="form-input" name="birth_date" id="birth_date" placeholder="MM-DD-YYYY" />
								</div>
								<div class="form-group">
									<label for="country">Root</label>
									<div class="select-list">
										<select name="country" id="country" required>
											<option value="UK">SNS를 통해</option>
											<option value="US">지인의 소개를 통해</option>
											<option value="VN">검색을 하다가</option>
										</select>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group">
									<label for="code">추천인 ID</label>
									<input type="text" class="form-input" name="recommend" id="recommend" />
									</div>
								</div>
							</div>
						</div>
			
						<div class="form-group">
							<input type="submit" name="submit" id="submit" class="form-submit" value="Submit"/>
							<input onclick="location.href='goto.Index'" type="button" class="form-submit" value="Go To Home" style="margin-right: 5px"/>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>


</body>
</html>