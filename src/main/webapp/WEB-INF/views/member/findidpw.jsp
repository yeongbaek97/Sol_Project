<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="css/style.css">
<meta name="robots" content="noindex, follow">
<script nonce="662e5c57-938f-4f58-88c5-32415831af11">(function(w,d){!function(a,e,t,r,z){a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zarazData.tracks=[],a.zaraz={deferred:[]};var s=e.getElementsByTagName("title")[0];s&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),a.zarazData.w=a.screen.width,a.zarazData.h=a.screen.height,a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.dataLayer=a.dataLayer||[],a.zaraz.track=(e,t)=>{for(key in a.zarazData.tracks.push(e),t)a.zarazData["z_"+key]=t[key]},a.zaraz._preSet=[],a.zaraz.set=(e,t,r)=>{a.zarazData["z_"+e]=t,a.zaraz._preSet.push([e,t,r])},a.dataLayer.push({"zaraz.start":(new Date).getTime()}),a.addEventListener("DOMContentLoaded",(()=>{var t=e.getElementsByTagName(r)[0],z=e.createElement(r);z.defer=!0,z.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script>
</head>
<body>
	<div class="main">
	<div class="container">
	<div class="signup-content">
		<div class="signup-form">
		<form method="POST" class="register-form" id="register-form">
			<h2>아이디 찾기</h2>
			<div class="form-row">
				<label for="gender" class="radio-label">Gender :</label>
				<div class="form-radio-item">
					<input type="radio" name="gender" id="male" checked>
					<label for="male">Male</label> <span class="check"></span>
				</div>
				<div class="form-radio-item">
					<input type="radio" name="gender" id="female">
					<label for="female">Female</label> <span class="check"></span>
				</div>
			</div>
			<div class="form-group">
				<input type="text" name="m_name" id="birth_date" placeholder="User Name">
			</div>
			<div class="form-group">
				<input type="email" name="m_email" id="email" placeholder="User E-Mail"/>
			</div>
			<div class="form-submit">
				<input type="submit" value="아이디 찾기" class="submit" id="reset" />
				<input type="submit" value="로그인" class="submit" id="submit" />
			</div>
		</form>
		</div>
		<div class="signup-form">
		<form method="POST" class="register-form" id="register-form">
			<h2>student registration form</h2>
			<div class="form-row">
				<div class="form-group">
					<label for="name">Name :</label> <input type="text" name="name" id="name" required />
				</div>
				<div class="form-group">
					<label for="father_name">Father Name :</label>
					<input type="text" name="father_name" id="father_name" required />
				</div>
			</div>
			<div class="form-group">
				<label for="address">Address :</label> <input type="text" name="address" id="address" required />
			</div>
			<div class="form-radio">
				<label for="gender" class="radio-label">Gender :</label>
				<div class="form-radio-item">
					<input type="radio" name="gender" id="male" checked>
					<label for="male">Male</label> <span class="check"></span>
				</div>
				<div class="form-radio-item">
					<input type="radio" name="gender" id="female">
					<label for="female">Female</label> <span class="check"></span>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label for="state">State :</label>
					<div class="form-select">
						<select name="state" id="state">
							<option value=""></option>
							<option value="us">America</option>
							<option value="uk">English</option>
						</select> <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
					</div>
				</div>
				<div class="form-group">
					<label for="city">City :</label>
					<div class="form-select">
						<select name="city" id="city">
							<option value=""></option>
							<option value="losangeles">Los Angeles</option>
							<option value="washington">Washington</option>
						</select> <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="birth_date">DOB :</label> <input type="text" name="birth_date" id="birth_date">
			</div>
			<div class="form-group">
				<label for="pincode">Pincode :</label> <input type="text" name="pincode" id="pincode">
			</div>
			<div class="form-group">
				<label for="course">Course :</label>
				<div class="form-select">
					<select name="course" id="course">
						<option value=""></option>
						<option value="computer">Computer Operator & Pragramming Assistant</option>
						<option value="desiger">Designer</option>
						<option value="marketing">Marketing</option>
					</select> <span class="select-icon"><i class="zmdi zmdi-chevron-down"></i></span>
				</div>
			</div>
			<div class="form-group">
				<label for="email">Email ID :</label> <input type="email" name="email" id="email" />
			</div>
			<div class="form-submit">
				<input type="submit" value="Reset All" class="submit" name="reset" id="reset" />
				<input type="submit" value="Submit Form" class="submit" name="submit" id="submit" />
			</div>
		</form>
		</div>
	</div>
	</div>
	</div>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>

	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194"
		integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw=="
		data-cf-beacon='{"rayId":"6ea2fd01fed5fffc","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2021.12.0","si":100}'
		crossorigin="anonymous"></script>
</body>
</html>