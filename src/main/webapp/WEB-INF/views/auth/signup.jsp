<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="/css/join.css">
<!-- ICON fork.png / icon_fork.ico -->
<link rel="shortcut icon" href="/images/icon_fork.ico">
<title>Join page</title>
</head>
<body>
	<div class="container">
		<div class="move">
			<div class="p-button normal signin animated pulse"
				onclick="location.href='/auth/signin'">SIGN IN</div>
		</div>
		<div class="welcome">
			<h4 class="bold welcome-text">Welcome Back!</h4>
			<p class="normal text">To keep connected with us please login
				with your personal info</p>
		</div>
		<div class="hello">
			<h4 class="bold welcome-text">Hello Friend</h4>
			<p class="normal text">Enter your personal details and start
				journey with us</p>
		</div>
		<!-- 회원가입 폼 -->
		<div class="form">
			<h4 class="bold title">Create Account</h4>
			<p class="korean light">환영합니다! 회원가입 페이지 입니다.</p>
			<!-- 회원가입 인풋 -->
			<form action="/auth/signup" method="post">
				<input type="text" class="normal" placeholder="ID" name="username"
					maxlength="20"> <input type="password" class="normal"
					placeholder="Password" name="password" maxlength="20"> <input
					type="email" class="normal" placeholder="Email" name="email"
					maxlength="50"> <input type="text" class="normal name"
					placeholder="Name" name="name" maxlength="20"> <input
					type="submit" class="b-button korean" value="회원가입">
			</form>
		</div>
	</div>
</body>
</html>
