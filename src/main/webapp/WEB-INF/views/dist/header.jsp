<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/header2.css">
<script src="https://kit.fontawesome.com/kit_code.js"
	crossorigin="anonymous">
	
</script>
<title>Nav Bar</title>
</head>

<body>
	<nav class="navbar">

		<div class="navbar__logo" style="align-items: flex-start;">
			<i class="fas fa-blog"></i>
			<h2>
				<a href="">내안의, 냉장고</a>
			</h2>
		</div>

		<ul class="navbar__menu">
			<li><a href="#">Home</a></li>
			<li><a href="#">Gallery</a></li>
			<li><a href="#">Weddings</a></li>
			<li><a href="#">FAQ</a></li>
			<li><a href="#">Bookings</a></li>
		</ul>

		<ul class="navbar__icons">
			<li><i class="fab fa-google"></i></li>
			<li><i class="fab fa-slack"></i></li>
		</ul>
		<a href="#" class="navbar__toggleBtn"> <i class="fas fa-hamburger"><img
				alt="menu" src="/images/list.png"
				style="width: 30px; height: 30px; margin-right: 15px;"></i>
		</a>
	</nav>
	<script src="/js/header2.js"></script>
</body>
</html>