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
							<input type="text" class="form-input" name="m_name" id="first_name" />
						</div>
						
						<div class="form-group">
							<label for="last_name">ID</label>
							<input type="text" class="form-input" name="m_id" id="last_name" />
						</div>
						
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" class="form-input" name="m_email" id="email"/>
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
							<input type="number" class="form-input" name="m_number" id="phone_number" />
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
									<label for="country">Country</label>
									<div class="select-list">
										<select name="country" id="country" required>
											<option value="UK">English</option>
											<option value="US">United State</option>
											<option value="VN">Viet Nam</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="city">City</label>
									<div class="select-list">
										<select name="city" id="city" required>
											<option value="NY">NewYork</option>
											<option value="IC">IceLand</option>
											<option value="canada">Canada</option>
										</select>
									</div>
								</div>
							</div>
						</div>
			
						<div class="form-group">
							<input onclick="location.href='goto.Index'" type="button" id="submit" class="form-submit" value="Go To Home"/>
							&nbsp;&nbsp;
							<input type="submit" name="submit" id="submit" class="form-submit" value="Submit"/>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>


</body>
</html>