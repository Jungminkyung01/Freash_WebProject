<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필</title>

<!-- ICON fork.png / icon_fork.ico -->
<link rel="shortcut icon" href="/images/icon_fork.ico">

<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Style -->
<link rel="stylesheet" href="/css/profile.css">
<link rel="stylesheet" href="/css/profile2.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<!-- Fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet">
</head>

<body>

	<!-- principalId 담아두는 곳 -->
	<input type="hidden" id="principalId" value="${principal.user.id}" />



	<!--프로필 섹션-->
	<section class="profile">
		<div class="container" x-data="{ rightSide: false, leftSide: false }">
			<div class="left-side" :class="{'active' : leftSide}">
				<div class="left-side-button" @click="leftSide = !leftSide">
					<svg viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"
						fill="none" stroke-linecap="round" stroke-linejoin="round">
						<line x1="3" y1="12" x2="21" y2="12"></line>
						<line x1="3" y1="6" x2="21" y2="6"></line>
						<line x1="3" y1="18" x2="21" y2="18"></line></svg>
					<svg stroke="currentColor" stroke-width="2" fill="none"
						stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
  <path d="M19 12H5M12 19l-7-7 7-7" />
</svg>
				</div>
				<!-- Logo -->
				<div class="logo" style="margin-left: 70px;">내안의, 냉장고</div>
				<!-- ***** Menu Start ****** -->
				<div class="side-wrapper">
					<div class="side-title">MENU</div>
					<div class="side-menu">
						<a href="/dist/index"> <svg xmlns="http://www.w3.org/2000/svg"
								fill="none" stroke="currentColor" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round"
								viewBox="0 0 24 24">
            <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
            <path d="M9 22V12h6v10" />
          </svg> Home
						</a> <a href="/main/main01_M"> <svg stroke="currentColor"
								stroke-width="2" fill="none" stroke-linecap="round"
								stroke-linejoin="round" viewBox="0 0 24 24">
            <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
            <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
          </svg> 레시피
						</a> <a href="/image/popular"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<path
									d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
							추천 레시피
						</a> <a href="/image/chef"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<path
									d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
							쉐프
						</a> <a href="/user/${principal.user.id}"> <svg
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
								fill="none" stroke="currentColor" stroke-width="2"
								stroke-linecap="round" stroke-linejoin="round">
            <rect x="3" y="3" width="18" height="18" rx="2" ry="2" />
            <circle cx="8.5" cy="8.5" r="1.5" />
            <path d="M21 15l-5-5L5 21" />
          </svg> Profile
						</a>
					</div>
				</div>
				<!-- ***** Menu End ****** -->

				<!-- ***** Log Out Start ***** -->
				<a href="/logout" class="follow-me" target="_blank"> <span
					class="follow-text"> <svg xmlns="http://www.w3.org/2000/svg"
							width="24" height="24" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round"
							stroke-linejoin="round">
							<path
								d="M10 3H6a2 2 0 0 0-2 2v14c0 1.1.9 2 2 2h4M16 17l5-5-5-5M19.8 12H9" /></svg>
						로그아웃
				</span> <span class="developer"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<path
								d="M10 3H6a2 2 0 0 0-2 2v14c0 1.1.9 2 2 2h4M16 17l5-5-5-5M19.8 12H9" /></svg>
						로그아웃 하기!
				</span>
				</a>
				<!-- ***** Log Out End***** -->
			</div>

			<!-- Test Start -->
			<div class="main">
				<div class="search-bar">
					<input type="text" placeholder="Search" />
					<button class="right-side-button" @click="rightSide = !rightSide">
						<svg viewBox="0 0 24 24" width="24" height="24"
							stroke="currentColor" stroke-width="2" fill="none"
							stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1">
				<path
								d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
					</button>
				</div>
				<!-- ***** Main ***** -->
				<div class="main-container">
					<!-- ***** profile ***** -->
					<div class="profile">
						<!-- ***** 유저 이미지 ***** -->
						<div class="profile-avatar">

							<form id="userProfileImageForm">
								<input type="file" name="profileImageFile"
									style="display: none;" id="userProfileImageInput" />
							</form>
							<!-- 유저 이미지 -->
							<div
								onclick="profileImageUpload(${dto.user.id}, ${principal.user.id})">
								<img class="profile-img"
									src="/upload/${dto.user.profileImageUrl}"
									onerror="this.src='/images/person.jpeg'" id="userProfileImage" />
							</div>
							<!-- 유저 네임 -->
							<div class="profile-name">${dto.user.username}</div>
							<div style="margin-left: 60px;">
								<c:choose>
									<c:when test="${dto.pageOwnerState}">
										<button class="status-share"
											onclick="location.href='/image/upload'">레시피등록</button>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${dto.subscribeState}">
												<button class="cta blue"
													onclick="toggleSubscribe(${dto.user.id}, this)">구독취소</button>
											</c:when>
											<c:otherwise>
												<button class="cta"
													onclick="toggleSubscribe(${dto.user.id}, this)">구독하기</button>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- ***** 배경 이미지 ***** -->
						<img
							src="https://images.unsplash.com/photo-1508247967583-7d982ea01526?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80"
							alt="" class="profile-cover">
						<!-- ***** 프로필 메뉴 ***** -->
						<div class="profile-menu">
							<a class="profile-menu-link active">Timeline</a>

						</div>

					</div>
					<!-- ***** profile End***** -->
					<!-- ***** timeLine***** -->
					<div class="timeline">
						<div class="timeline-left">
							<!-- Introduce -->
							<div class="intro box">
								<div class="intro-title">
									Introduction
									<button class="intro-menu"></button>
								</div>
								<div class="info">
									<div class="info-item">
										<svg xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 503.889 503.889" fill="currentColor">
                  <path
												d="M453.727 114.266H345.151V70.515c0-20.832-16.948-37.779-37.78-37.779H196.517c-20.832 0-37.78 16.947-37.78 37.779v43.751H50.162C22.502 114.266 0 136.769 0 164.428v256.563c0 27.659 22.502 50.161 50.162 50.161h403.565c27.659 0 50.162-22.502 50.162-50.161V164.428c0-27.659-22.503-50.162-50.162-50.162zm-262.99-43.751a5.786 5.786 0 015.78-5.779h110.854a5.786 5.786 0 015.78 5.779v43.751H190.737zM32 164.428c0-10.015 8.147-18.162 18.162-18.162h403.565c10.014 0 18.162 8.147 18.162 18.162v23.681c0 22.212-14.894 42.061-36.22 48.27l-167.345 48.723a58.482 58.482 0 01-32.76 0L68.22 236.378C46.894 230.169 32 210.321 32 188.109zm421.727 274.725H50.162c-10.014 0-18.162-8.147-18.162-18.161V253.258c8.063 6.232 17.254 10.927 27.274 13.845 184.859 53.822 175.358 52.341 192.67 52.341 17.541 0 7.595 1.544 192.67-52.341 10.021-2.918 19.212-7.613 27.274-13.845v167.733c.001 10.014-8.147 18.162-18.161 18.162z" /></svg>
										Contact <a href="#">${dto.user.email}</a>
									</div>
									<div class="info-item">
										<svg xmlns="http://www.w3.org/2000/svg" fill="none"
											stroke="currentColor" stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" viewBox="0 0 24 24">
                  <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
                  <path d="M9 22V12h6v10" />
                </svg>
										Gender <a href="#">${dto.user.gender}</a>
									</div>
									<div class="info-item">
										<svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"
											fill="currentColor">
                  <path
												d="M437 75C388.7 26.6 324.4 0 256 0S123.3 26.6 75 75C26.6 123.3 0 187.6 0 256s26.6 132.7 75 181c48.3 48.4 112.6 75 181 75s132.7-26.6 181-75c48.4-48.3 75-112.6 75-181s-26.6-132.7-75-181zM252.4 481.9c-52-.9-103.7-19.5-145.2-55.8L256 277.2l21.7 21.8a165.9 165.9 0 00-35.7 87c-3.5 30.5 0 63.3 10.4 95.9zM299 320.3l105.7 105.8a224.8 224.8 0 01-121.3 54.1C262 419.5 268 360.3 299 320.3zm21.2-21.2c40-31 99.2-37 160-15.6A224.8 224.8 0 01426 404.8zM482 252.4a231.7 231.7 0 00-96-10.4 165.9 165.9 0 00-87 35.7L277.3 256l148.9-148.8c36.3 41.5 55 93.2 55.8 145.2zm-290.2-39.5c-40 31-99.2 37-160 15.6A224.8 224.8 0 0186 107.2zm-84.5-127a224.8 224.8 0 01121.3-54.1C250 92.5 244 151.7 213 191.7zM270 126c3.5-30.5 0-63.3-10.4-95.9 52 .9 103.7 19.5 145.2 55.8L256 234.8 234.3 213a165.9 165.9 0 0035.7-87zM30 259.6a242 242 0 0072.7 11.7c7.8 0 15.6-.5 23.2-1.3a165.9 165.9 0 0087-35.7l21.8 21.7L85.9 404.8a225.3 225.3 0 01-55.8-145.2z" /></svg>
										User name <a href="#">${dto.user.username}</a>
									</div>
								</div>
							</div>
							<!-- Event Box -->
							<div class="event box">
								<div class="event-wrapper">
									<img
										src="https://images.unsplash.com/photo-1577303935007-0d306ee638cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTB8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
										class="event-img" />
									<div class="event-date">
										<div class="event-month">May</div>
										<div class="event-day">05</div>
									</div>
									<div class="event-title">Winter Wonderland</div>
									<div class="event-subtitle">16st May, 2023 03:00PM</div>
								</div>
							</div>
						</div>
						<!-- ***** Right ***** -->
						<div class="timeline-right">
							<!-- ***** status box ***** -->
							<div class="status box">
								<div class="status-menu">
									<a class="status-menu-item active" href="#">Status</a>
								</div>
								<div class="status-main">
									<img class="status-img"
										src="/upload/${dto.user.profileImageUrl}"
										onerror="this.src='/images/person.jpeg'" id="userProfileImage" />
									<div class="state">
										<h4>${dto.user.bio}</h4>
										<h4>${dto.user.website}</h4>
									</div>
								</div>
								<div class="status-actions">
									<a href="#" class="status-action"> <svg
											viewBox="-42 0 512 512" xmlns="http://www.w3.org/2000/svg">
                  <path
												d="M333.7 123.3c0 33.9-12.2 63.2-36.2 87.2-24 24-53.3 36.1-87.1 36.1h-.1c-33.9 0-63.2-12.1-87.1-36.1-24-24-36.2-53.3-36.2-87.2 0-33.9 12.2-63.2 36.2-87.2 24-24 53.2-36 87-36.1h.2c33.8 0 63.2 12.2 87.1 36.1 24 24 36.2 53.3 36.2 87.2zm0 0"
												fill="#ffbb85" />
                  <path
												d="M427.2 424c0 26.7-8.5 48.3-25.3 64.3-16.5 15.7-38.4 23.7-65 23.7H90.2c-26.6 0-48.5-8-65-23.7C8.5 472.3 0 450.7 0 423.9c0-10.2.3-20.4 1-30.2a302.7 302.7 0 0112.1-64.9c3.3-10.3 7.8-20.5 13.4-30.3 5.8-10.2 12.5-19 20.1-26.3a89 89 0 0129-18.2c11.2-4.4 23.7-6.7 37-6.7 5.2 0 10.3 2.2 20 8.5l21 13.5c6.6 4.3 15.7 8.3 27 11.9a107.7 107.7 0 0033 5.3c11 0 22-1.8 33-5.3 11.2-3.6 20.3-7.6 27-12l21-13.4c9.7-6.3 14.7-8.5 20-8.5 13.3 0 25.7 2.3 37 6.7a89 89 0 0128.9 18.2c7.6 7.3 14.4 16.1 20.2 26.3 5.5 9.8 10 20 13.3 30.3a305.5 305.5 0 0112.1 64.9c.7 9.8 1 20 1 30.2zm0 0"
												fill="#6aa9ff" />
                  <path
												d="M210.4 246.6h-.1V0c34 0 63.3 12.2 87.2 36.1 24 24 36.2 53.3 36.2 87.2 0 33.9-12.2 63.2-36.2 87.2-24 24-53.3 36.1-87.1 36.1zm0 0"
												fill="#f5a86c" />
                  <path
												d="M427.2 424c0 26.7-8.5 48.3-25.3 64.3-16.5 15.7-38.4 23.7-65 23.7H210.2V286.5h3.3c11 0 22-1.8 33-5.3 11.2-3.6 20.3-7.6 27-12l21-13.4c9.7-6.3 14.7-8.5 20-8.5 13.3 0 25.7 2.3 37 6.7a89 89 0 0128.9 18.2c7.6 7.3 14.4 16.1 20.2 26.3 5.5 9.8 10 20 13.3 30.3a305.5 305.5 0 0112.1 64.9c.7 9.8 1 20 1 30.2zm0 0"
												fill="#2682ff" />
                </svg> People
									</a>

									<c:choose>
										<c:when test="${dto.pageOwnerState}">
											<button class="status-share"
												onclick="location.href='/user/${dto.user.id}/update'">회원정보
												변경</button>
										</c:when>
										<c:otherwise>
											<span></span>
										</c:otherwise>
									</c:choose>


								</div>
							</div>
							<!-- ***** status box End ***** -->
							<!-- ***** album box ***** -->
							<!-- 등록한 레시피 / 찜한 레시피 들어갈 부분 -->
							<div class="album box">
								<div class="status-main">
									<img class="status-img"
										src="/upload/${dto.user.profileImageUrl}"
										onerror="this.src='/images/person.jpeg'" id="userProfileImage" />
									<div class="album-detail">
										<div class="album-title">
											<strong>My Recipe</strong>
										</div>

									</div>
									<button class="intro-menu"></button>
								</div>
								<div class="album-content">
									<p>
										등록한 레시피: <b><span>${dto.imageCount}</span></b>
									</p>
									<a href="/user/myRecipe/${dto.user.id}"><span
										style="color: white;">더보기 ></span></a>
									<div class="album-photos">
										<img
											src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
											alt="" class="album-photo" />
										<div class="album-right">
											<img
												src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
												alt="" class="album-photo" />
										</div>
									</div>
								</div>



							</div>
						</div>
					</div>
				</div>
				<!-- ***** ***** -->
			</div>
			<!-- Test End -->
			<!-- 구독 정보 -->
			<div class="right-side" :class="{ 'active': rightSide }">
				<!-- account -->
				<div class="account">
					<button class="account-button">
						<svg stroke="currentColor" stroke-width="2" fill="none"
							stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"
							viewBox="0 0 24 24">
          <path
								d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9M13.73 21a2 2 0 01-3.46 0" />
        </svg>
					</button>
					<span class="account-user"> 구독하고 있는 쉐프 <span>&raquo;</span>
					</span>
				</div>
				<!-- side-wrapper stories -->
				<div class="side-wrapper stories subscribe">
					<div class="side-title">NOW</div>
					<div class="user"
						onclick="location.href='javascript:subscribeInfoModalOpen(${dto.user.id});'">
						<div class="username">
							구독정보 <span>${dto.subscribeCount}</span>
							<div class="album-date"></div>
							<br>

						</div>

					</div>
					<div class="subscribe-list" id="subscribeModalList">
						<!-- 현재 구독하고 있는 구독자를 보여줌 -->
					</div>
				</div>
				<!-- side-wrapper stories -->

				<div class="side-wrapper contacts">
					<div class="side-title">CONTACTS</div>
					<div class="user">
						<img src="/images/egg01.jpg" class="user-img">
						<div class="username">
							내안의, 매니저
							<div class="user-status"></div>
						</div>
					</div>

				</div>
				<!-- side-wrapper stories End -->
				<div class="search-bar right-search">
					<input type="text" placeholder="Search" />
					<div class="search-bar-svgs">
						<svg stroke="currentColor" stroke-width="2" fill="none"
							stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"
							viewBox="0 0 24 24">
          <circle cx="12" cy="12" r="3" />
          <path
								d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 010 2.83 2 2 0 01-2.83 0l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 01-2 2 2 2 0 01-2-2v-.09A1.65 1.65 0 009 19.4a1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83 0 2 2 0 010-2.83l.06-.06a1.65 1.65 0 00.33-1.82 1.65 1.65 0 00-1.51-1H3a2 2 0 01-2-2 2 2 0 012-2h.09A1.65 1.65 0 004.6 9a1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 010-2.83 2 2 0 012.83 0l.06.06a1.65 1.65 0 001.82.33H9a1.65 1.65 0 001-1.51V3a2 2 0 012-2 2 2 0 012 2v.09a1.65 1.65 0 001 1.51 1.65 1.65 0 001.82-.33l.06-.06a2 2 0 012.83 0 2 2 0 010 2.83l-.06.06a1.65 1.65 0 00-.33 1.82V9a1.65 1.65 0 001.51 1H21a2 2 0 012 2 2 2 0 01-2 2h-.09a1.65 1.65 0 00-1.51 1z" />
        </svg>
						<svg fill="currentColor" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 469.34 469.34">
          <path
								d="M456.84 76.17l-64-64.06c-16.13-16.13-44.18-16.17-60.37.04L45.77 301.67a10.73 10.73 0 00-2.7 4.59L.41 455.73a10.68 10.68 0 0013.19 13.2l149.33-42.7c1.73-.5 3.3-1.42 4.58-2.7l289.33-286.98c8.06-8.07 12.5-18.78 12.5-30.19s-4.44-22.12-12.5-30.2zM285.99 89.74L325.25 129l-205 205-14.7-29.44a10.67 10.67 0 00-9.55-5.9H78.92L286 89.75zM26.2 443.14l13.9-48.64 34.74 34.74-48.64 13.9zm123.14-35.18L98.3 422.54l-51.5-51.5L61.38 320H89.4l18.38 36.77a10.67 10.67 0 004.77 4.77l36.78 18.39v28.03zm21.33-17.54v-17.09c0-4.04-2.28-7.72-5.9-9.54l-29.43-14.7 205-205 39.26 39.26-208.93 207.07zm271.11-268.7l-47.03 46.61L301 74.6l46.59-47c8.06-8.07 22.1-8.07 30.16 0l64 64c4.03 4.03 6.25 9.38 6.25 15.08s-2.22 11.05-6.22 15.05z" /></svg>
						<svg stroke="currentColor" stroke-width="2" fill="none"
							stroke-linecap="round" stroke-linejoin="round"
							viewBox="0 0 24 24">
      <path d="M12 5v14M5 12h14" />
    </svg>
					</div>
				</div>
			</div>
			<!-- 구독 정보 End -->
			<div class="overlay" @click="rightSide = false; leftSide = false"
				:class="{ 'active': rightSide || leftSide }"></div>
		</div>
	</section>


	<script src="/js/profile.js"></script>

	<%@ include file="../main/footer.jsp"%>