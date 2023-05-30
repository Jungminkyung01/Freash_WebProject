<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../main/header.jsp"%>

<!-- ***** Content Start ***** -->
<!-- Start retroy layout blog posts -->
<!-- 추천레시피 Start -->
<section class="section">
	<div class="container">
		<div>
			<h2>추천레시피를 보고 맛있는 음식을 만들어보세요!</h2>
		</div>
		<br>
		<div class="row align-items-stretch retro-layout">
			<div class="col-md-4">
				<a href="/image/recipe/24" class="h-entry mb-30 v-height gradient">

					<div class="featured-img"
						style="background-image: url('/upload/1f21ed8d-2c08-4b75-8b68-021f00b4052e_시금5.PNG');"></div>

					<div class="text">
						<span class="date">유명 인기 맛집 통닭!</span>
						<h2>시금치 통닭</h2>
					</div>
				</a> <a href="/image/recipe/23" class="h-entry v-height gradient">

					<div class="featured-img"
						style="background-image: url('/upload/091bbfc6-225c-418e-8a36-122180de1507_통.PNG');"></div>

					<div class="text">
						<span class="date">묵은지로 만든</span>
						<h2>돼지고기 김치 찜</h2>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="/image/recipe/21" class="h-entry img-5 h-100 gradient">

					<div class="featured-img"
						style="background-image: url('/upload/b45c04f8-dbcf-480f-87d7-b497d7366d4b_물갈비.PNG');"></div>

					<div class="text">
						<span class="date">이름만 들어도 푸짐한</span>
						<h2>산더미 물갈비</h2>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="/image/recipe/20" class="h-entry mb-30 v-height gradient">

					<div class="featured-img"
						style="background-image: url('/upload/df87e8da-7c3f-43af-a50a-ce75293e082b_갈비.PNG');"></div>

					<div class="text">
						<span class="date">부드러운 육즙과 쫄깃한 식감을 </span>
						<h2>소고기 갈비찜</h2>
					</div>
				</a> <a href="/image/recipe/18" class="h-entry v-height gradient">

					<div class="featured-img"
						style="background-image: url('/upload/76a098ed-1ea3-43cf-a7ea-a4ced9fd42f5_백숙.PNG');"></div>

					<div class="text">
						<span class="date">몸보신에 최고</span>
						<h2>백숙</h2>
					</div>
				</a>
			</div>
		</div>
	</div>

</section>
<!-- 추천레시피 End -->
<!-- End retroy layout blog posts -->

<!-- Start posts-entry -->
<section class="section posts-entry bg-light">
	<div class="container">
		<div class="row mb-4">
			<div class="col-sm-6">
				<h2 class="posts-entry-title">요리 팁! 가이드를 따라 해보세요.</h2>
			</div>
			<div class="col-sm-6 text-sm-end">
				<a href="category.html" class="read-more">View All</a>
			</div>
		</div>
		<div class="row g-3">
			<div class="col-md-9">
				<div class="row g-3">
					<div class="col-md-6">
						<div class="blog-entry">
							<a href="#" class="img-link"> <img src="/images/달걀.PNG"
								alt="Image" class="img-fluid">
							</a> <span class="date">내안의, 매니저</span>
							<h2>
								<a href="#">삶은 달걀 쉽게 까는 방법</a>
							</h2>
							<p>달걀껍질 벗기기 어려 웠다면 한번 도전해보자</p>
							<p>
								<a href="#" class="btn btn-sm btn-outline-primary">Read More</a>
							</p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="blog-entry">
							<a href="#" class="img-link"> <img src="/images/양배추.PNG"
								alt="Image" class="img-fluid">
							</a> <span class="date">내안의, 매니저</span>
							<h2>
								<a href="#">양배추 야무지게 먹는방법</a>
							</h2>
							<p>버리는 부분 없이 양배추를 100% 활용해보자</p>
							<p>
								<a href="#" class="btn btn-sm btn-outline-primary">Read More</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<ul class="list-unstyled blog-entry-sm">
					<li style="margin: 50px 10px 40px 0;"><span class="date">내안의,
							매니저</span>
						<h3>
							<a href="#">다진마늘 쉽게 보관하는 방법</a>
						</h3>
						<p>요리할 때, 그때 그때 마늘을 사용할 수 있도록</p>
						<p>
							<a href="#" class="read-more">Continue Reading</a>
						</p></li>
					<hr>
					<li style="margin: 50px 10px 40px 0;"><span class="date">내안의,
							매니저</span>
						<h3>
							<a href="#">계량하기</a>
						</h3>
						<p>요리를 위한 첫번째 발걸음! 계량하는방법을 배워보자</p>
						<p>
							<a href="#" class="read-more">Continue Reading</a>
						</p></li>
					<hr>
					<li style="margin: 50px 10px 40px 0;"><span class="date">내안의,
							매니저</span>
						<h3>
							<a href="#">선물 보자기 포장하는 방법</a>
						</h3>
						<p>정성을 더 아름답게 담아보세요</p>
						<p>
							<a href="#" class="read-more">Continue Reading</a>
						</p></li>
				</ul>
			</div>
		</div>
	</div>
</section>
<!-- End posts-entry -->

<section class="section">
	<div class="container">

		<div class="row mb-4">
			<div class="col-sm-6">
				<h2 class="posts-entry-title">Meat</h2>
			</div>
			<div class="col-sm-6 text-sm-end">
				<a href="#" class="read-more"><b>최신순</b>▼</a>
			</div>
		</div>
		<!-- 레시피 정보 Start -->
		<div class="row" id="mainMeatList">
			<!-- main.js에 작성 -->


		</div>
		<!-- 레시피 정보 End -->
	</div>
</section>

<!-- ***** Content End ***** -->

<!-- Preloader -->
<div id="overlayer"></div>
<div class="loader">
	<div class="spinner-border text-primary" role="status">
		<span class="visually-hidden">Loading...</span>
	</div>
</div>

<script src="/js/main.js"></script>

<!-- JS -->
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/tiny-slider.js"></script>

<script src="/js/flatpickr.min.js"></script>


<script src="/js/aos.js"></script>
<script src="/js/glightbox.min.js"></script>
<script src="/js/navbar.js"></script>
<script src="/js/counter.js"></script>
<script src="/js/custom.js"></script>

<%@ include file="../main/footer.jsp"%>