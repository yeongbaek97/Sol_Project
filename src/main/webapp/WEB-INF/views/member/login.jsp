<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/loginutil.css">
	<link rel="stylesheet" type="text/css" href="resources/css/loginmain.css">
<!--===============================================================================================-->

<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/js/loginmain.js"></script>
	
<style type="text/css">
.limiter{
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#8A8C8F), to(#343a40));
	background: -webkit-linear-gradient(bottom left, #8A8C8F 0%, #343a40 100%);
	background: -moz-linear-gradient(bottom left, #8A8C8F 0%, #343a40 100%);
	background: -o-linear-gradient(bottom left, #8A8C8F 0%, #343a40 100%);
	background: linear-gradient(to top right, #8A8C8F 0%, #343a40 100%);
}
</style>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="javascript:login();" class="login100-form validate-form p-l-55 p-r-55 p-t-178" method="post">
					<span class="login100-form-title">
						SIGN IN
					</span>



					<div class="wrap-input100 validate-input m-t-16 m-b-16" data-validate="Please enter userID">
						<input class="input100" type="text" id="m_id" name="m_id" placeholder="UserID">

						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Please enter password">
						<input class="input100" type="password" id="m_pw" name="m_pw" placeholder="Password">
						<span class="focus-input100"></span>
					</div>

					<div class="text-right p-t-13 p-b-23">
						<span class="txt1">
							Forgot?
						</span>

						<a href="findInfo.login" class="txt2">
							UserID / Password
						</a>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="aaa">
							Sign in
						</button>
					</div>
					
					<div class="flex-col-c p-t-10">
						<span class="txt1 p-b-9">
							다른 서비스 계정으로 로그인
						</span>
						<div class="container-login100-form-btn">
							<button style="background-color: #FEE500" type="button" class="login100-form-btn" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=500a463927b5af4c4a3224e8a14e8ace&redirect_uri=http://localhost/pj/kakao.login&response_type=code'">
								<img src="resources/img/kakao_login_medium_narrow.png">
							</button>
						</div>
					</div>

					<div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9">
							계정이 없으신가요?
						</span>

						<a href="goto.Reg" class="txt3">
							회원가입
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

</body>
</html>