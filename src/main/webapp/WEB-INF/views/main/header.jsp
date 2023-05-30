<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!doctype html>
<html lang="en" xmlns="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- ICON 로고-->
<link rel="shortcut icon" href="/images/icon_fork.ico">


<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	
<!-- Font -->
<link rel="stylesheet" href="/css/font.css">


<!-- CSS -->
<link rel="stylesheet" href="/css/update.css">
<link rel="stylesheet" href="/css/story.css">
<link rel="stylesheet" href="/css/tiny-slider.css">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/glightbox.min.css">
<link rel="stylesheet" href="/css/style2.css">

<link rel="stylesheet" href="/css/flatpickr.min.css">

<!-- Fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<title>내안의, 냉장고</title>

<!-- og태그 공유 -->
<meta property="og:title" content="내안의, 냉장고" />
<meta property="og:description" content="냉장고 속 재료로 건강한 한끼를 만들어 보자!" />
<meta property="og:image" content="https://images.unsplash.com/photo-1487770931682-b80013ed9cc9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80" />

</head>
<body>
	<!-- principalId 담아두는 곳 -->
	<input type="hidden" id="principalId" value="${principal.user.id}" />

		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close">
					<span class="icofont-close js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

		<nav class="site-nav">
			<div class="container">
				<div class="menu-bg-wrap">
					<div class="site-navigation">
						<div class="row g-0 align-items-center">
							<div class="col-2">
								<a href="/dist/index" class="logo m-0 float-start">내안의, 냉장고<span
									class="text-primary">.</span></a>
							</div>

							<div class="col-8 text-center">
								<!-- Search Form -->
								<form action="#" class="search-form d-inline-block d-lg-none">
									<input type="text" class="form-control" placeholder="Search...">
									<span class="bi-search"></span>
								</form>

								<ul
									class="js-clone-nav d-none d-lg-inline-block text-start site-menu mx-auto">
									<li class="active"><a href="/dist/index">Home</a></li>
									<li class="has-children"><a href="#">Pages</a>
										<ul class="dropdown">
											<li><a href="/main/main01_M">고기</a></li>
											<li><a href="/main/main02_V">채소류</a></li>
											<li><a href="/main/main03_S">해산물</a></li>
											<li><a href="/main/main04_P">유제품/계란</a></li>
											<li><a href="/main/main05_F">과일</a></li>
											<li><a href="#">Contact Us</a></li>
										</ul></li>
									<li><a href="/image/popular">추천 레시피</a></li>
									<li><a href="/image/chef">Chef</a></li>
									<li><a href="/user/${principal.user.id}">Plofile</a></li>
									<c:if test="${principal.user.username=='admin'}">
										<li><a href="/user/admin">관리자 화면</a></li>
									</c:if>
								</ul>
							</div>
							<div class="col-2 text-end">
								<a href="#"
									class="burger ms-auto float-end site-menu-toggle js-menu-toggle d-inline-block d-lg-none light">
									<span></span>
								</a>
								<form action="#" class="search-form d-none d-lg-inline-block">
									<input type="text" class="form-control" placeholder="Search...">
									<span class="bi-search"></span>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>