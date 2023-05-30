<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<style>
.banner {
	background-image:
		url("https://images.unsplash.com/photo-1505935428862-770b6f24f629?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1167&q=80");
	background-position: center 90%;
	background-size: cover;
	min-height: 200px;
	border-radius: 23px;
	padding: 80px 60px;
}

.banner h5 {
	font-size: 20px;
	color: #fff;
	font-weight: 700;
	margin-bottom: 25px;
}

.banner h4 {
	font-size: 45px;
	color: #262626;
	text-transform: uppercase;
	margin-bottom: 25px;
}

.banner h4 em {
	font-style: normal;
	color: #fff;
}
</style>
<!--인기 게시글-->
<main class="popular">

	<!-- principalId 담아두는 곳 -->
	<input type="hidden" id="principalId" value="${principal.user.id}" />

	<div class="exploreContainer">

		<!--인기게시글 갤러리(GRID배치)-->
		<div class="popular-gallery">
			<section class="section">
				<div class="container">

					<!-- Banner -->
					<div class="banner">
						<div class="row">
							<div class="col-lg-7">
								<div class="header-text">
									<h5>인기 라이프 스타일을 추천해 드려요</h5>
									<h4>
										<em>Welcome</em> 팔로잉
									</h4>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<!-- Banner End -->

					<div class="row mb-4">
						<div class="col-sm-6">
							<h2 class="posts-entry-title">유저 랭킹</h2>
						</div>
						<div class="col-sm-6 text-sm-end">
							<a href="#" class="read-more"><b>인기순</b>▼</a>
						</div>
					</div>

					<!-- 레시피 정보 Start -->
					<div class="row">
						<c:forEach var="image" items="${images}">
							<c:set var="i" value="${i+1 }" />
							<div class="col-lg-4 mb-4">

								<div class="post-entry-alt">

									<div>
										<h3>${i }</h3>
									</div>
									<div class="post-meta align-items-center text-left clearfix">
										<figure class="author-figure2 mb-0 me-3 float-start">
											<a href="/user/${image.id }"> <img
												src="/upload/${image.profileImageUrl}"
												onerror="this.src='/images/person.jpeg'" alt="Image"
												class="img-fluid">
											</a>
										</figure>
										<div style="align-items: center;">
											<h2 style="color: #262626; padding-top: 40px;">${image.username }</h2>
											<span class="d-inline-block mt-1"><b>${image.bio}</b>
											</span>
										</div>
									</div>
								</div>

							</div>
						</c:forEach>
						<!-- 레시피 정보 End -->
					</div>
				</div>
			</section>


		</div>

	</div>
</main>

<script src="/js/story.js"></script>
<%@ include file="../main/footer.jsp"%>