<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<style>
.banner {
	background-image:
		url("https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80");
	background-position: center 50%;
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
	color: #fff;
	text-transform: uppercase;
	margin-bottom: 25px;
}

.banner h4 em {
	font-style: normal;
	color: #262626;
}
</style>
<!--인기 게시글-->
<main class="popular">
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
									<h5>맛있는 레시피를 찾아보세요!</h5>
									<h4>
										<em>Welcome</em> 추천 레시피
									</h4>
								</div>
							</div>
						</div>
					</div>
					<br>
					<br>
					<!-- Banner End -->

					<div class="row mb-4">
						<div class="col-sm-6">
							<h2 class="posts-entry-title">랭킹</h2>
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

									<a href="/image/recipe/${image.id}" class="img-link"> <img
										src="/upload/${image.postImageUrl}"
										onerror="this.src='/images/person.jpeg'" alt="Image"
										class="img-fluid"></a>
									<div class="excerpt">
										<h5>
											<a href="/image/recipe/${image.id}">${image.title} </a>
										</h5>
										<div class="post-meta align-items-center text-left clearfix">
											<figure class="author-figure mb-0 me-3 float-start">
												<img src="/upload/${image.user.profileImageUrl}"
													onerror="this.src='/images/person.jpeg'" alt="Image"
													class="img-fluid">
											</figure>
											<span class="d-inline-block mt-1">By <a href="#">${image.user.username}</a>&nbsp;-&nbsp;
											</span> <span class="like"><b id="storyLikeCount-${image.id}">${image.likes.size()}
											</b>likes</span>
											<!-- 좋아요 개수를 불러올때, ${image.likes.size()}이 방법과 Service에 직접 작성하는 방법이 있다. -->
										</div>

										<span>난이도: ${image.difficult}</span> <span
											style="display: inline-block; margin: 0 5px; float: right;">조리시간:
											${image.cookTime}</span>

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