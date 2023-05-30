<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="/css/login.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<!-- ICON fork.png / icon_fork.ico -->
<link rel="shortcut icon" href="/images/icon_fork.ico">
<title>login page</title>
</head>
<body>
	<div class="container">
		<div class="move">
			<div class="p-button normal signin animated pulse"
				onclick="location.href='/auth/signup'">SIGN UP</div>
		</div>
		<div class="welcome">
			<h4 class="bold welcome-text">Hello Friend</h4>
			<p class="normal text">Enter your personal details and start
				journey with us</p>
		</div>
		<!-- 로그인 폼 -->
		<div class="form">
			<h4 class="bold title">Sign-in</h4>
			<!-- 로그인 인풋 -->
			<form action="/auth/signin" method="POST">
				<p class="normal light">로그인 페이지 입니다.</p>
				<input type="text" class="normal" placeholder="ID" name="username"
					maxlength="20"> <input type="password" class="normal"
					placeholder="Password" name="password" maxlength="20"> <input
					type="submit" class="b-button normal" value="로그인">
			</form>
			<!-- 로그인 인풋End -->
			<!-- Oauth 소셜로그인 -->
			<div class="login__facebook">
				<button
					onclick="javascript:location.href='/oauth2/authorization/facebook'">
					<i class="fab fa-facebook-square"></i> <span>Facebook으로 로그인</span>
				</button>
			</div>
			<!-- Oauth 소셜로그인end -->
			<!-- 
			<div>
			<p class="normal forgot" onclick="location.href='#'">Forgot your password?</p>
			</div>
			-->
		</div>
	</div>
</body>
</html>