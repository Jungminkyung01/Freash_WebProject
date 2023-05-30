<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.ArrayList"%>

<%@ include file="../main/header.jsp"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<style>
.mypic {
	width: 100%;
	height: 300px;
	background-position: center 30%;
	background-size: cover;
	color: white;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.mypost {
	width: 95%;
	max-width: 500px;
	margin: 20px auto 20px auto;
	box-shadow: 0px 0px 3px 0px black;
	padding: 20px;
}

.mypost>button {
	margin-top: 15px;
}

.mycards {
	width: 95%;
	max-width: 500px;
	margin: auto;
}

.mycards>.card {
	margin-top: 10px;
	margin-bottom: 10px;
}

p, span {
	font-size: 17px;
}
</style>

<script type="text/javascript">

function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

</script>

<!-- Content Start -->
<!-- header Start -->
<c:forEach var="recipe1" items="${recipe1}">
	<div
		class="site-cover site-cover-sm same-height overlay single-page mypic"
		style="background-image: url('https://images.unsplash.com/photo-1497888329096-51c27beff665?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80');">
		<div class="container">
			<div class="row same-height justify-content-center">
				<div class="col-md-6">
					<div class="post-entry text-center">
						<h1 class="mb-4">${recipe1.title }</h1>
						<div class="post-meta align-items-center text-center">
							<span>&nbsp;-&nbsp; ${recipe1.subTitle }</span> <br>
							<p>
								현재기온: <span id="temp">36</span>도
							</p>
						</div>
						

						<button onclick="deleteRecipe(${recipe1.id})" id="recipeDelete">레시피 삭제</button>
						<button onclick="location.href='/image/${recipe1.id}/update'">레시피 수정</button>
						<!-- 
						<button onclick="location.href='/image/${recipe1.id}/update'">레시피 수정</button>
						 -->
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
</c:forEach>
<!-- header End -->
<section class="section">
	<!--  id="recipeList" -->



	<div class="container">

		<div class="row blog-entries element-animate">

			<div class="col-md-12 col-lg-8 main-content">

				<div class="post-content-body"
					style="padding-left: 20px; padding-right: 20px;">
					<c:forEach var="recipe1" items="${recipe1}">
						<!-- 대표이미지 Start-->
						<div class="col-md-12 mb-4">
							<img src="/upload/${recipe1.postImageUrl}"
								alt="Image placeholder" class="img-fluid rounded"
								style="margin: auto; display: block;">
						</div>
						<!-- 대표이미지 End -->
						<br>
						<div
							style="float: right; margin-right: 70px; padding-right: 10px;"
							class="button gray medium" onclick="clip(); return false;">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								<circle cx="18" cy="5" r="3"></circle>
								<circle cx="6" cy="12" r="3"></circle>
								<circle cx="18" cy="19" r="3"></circle>
								<line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line>
								<line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line></svg>
							<p>공유</p>
							
						</div>
						<br>
						<!-- 대표 정보 Start -->

						<div>
							<div style="margin: 50px 0px 50px 0px; text-align: center;">
								<h5>${recipe1.subTitle }</h5>
								<h2 style="color: #262626;">${recipe1.title }</h2>
								<br>
								<br> <span><span><b>난이도: </b>${recipe1.difficult}</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span><b>소요시간: </b>${recipe1.cookTime}</span></span>
								<br>
								<br>

								<div id="heart"></div>

							</div>
							<div style="margin: 50px 0px 50px 0px;">
								<h3>요리 팁</h3>
								<hr style="height: 5px; border: 0;">
								<p>${recipe1.cookTip}</p>
							</div>
						</div>
						<!-- 재료 -->
					</c:forEach>
					<div style="margin: 50px 0px 50px 0px;">
						<h2>
							재료 <span>Ingredients</span>
						</h2>
						<hr style="height: 5px; border: 0;">
						<p>사용한 재료: <span></span></p>
					</div>
					<!-- 대표정보 End -->
					<!-- 상세 레시피 Start -->

					<c:forEach var="recipe" items="${recipe}">
						<div>
							<h2>
								레시피 <span>Recipe</span>
							</h2>
							<hr style="height: 5px; border: 0;">

							<div class="row my-4">
								<div class="col-md-6 mb-4">
									<img src="/upload/${recipe.postImageUrl01}"
										alt="Image placeholder" class="img-fluid rounded">
								</div>
								<div class="col-md-6 mb-4">
									<h5>Step1</h5>
									<hr>
									<p>${recipe.cation01}</p>
								</div>
							</div>
							<br>

							<div class="row my-4">
								<div class="col-md-6 mb-4">
									<img src="/upload/${recipe.postImageUrl02}"
										alt="Image placeholder" class="img-fluid rounded">
								</div>
								<div class="col-md-6 mb-4">
									<h5>Step2</h5>
									<hr>
									<p>${recipe.cation02}</p>
								</div>
							</div>
							<br>

							<div class="row my-4">
								<div class="col-md-6 mb-4">
									<img src="/upload/${recipe.postImageUrl03}"
										alt="Image placeholder" class="img-fluid rounded">
								</div>
								<div class="col-md-6 mb-4">
									<h5>Step3</h5>
									<hr>
									<p>${recipe.cation03}</p>
								</div>
							</div>
							<br>

							<div class="row my-4">
								<div class="col-md-6 mb-4">
									<img src="/upload/${recipe.postImageUrl04}"
										alt="Image placeholder" class="img-fluid rounded">
								</div>
								<div class="col-md-6 mb-4">
									<h5>Step4</h5>
									<hr>
									<p>${recipe.cation04}</p>
								</div>
							</div>
							<br>

							<div class="row my-4">
								<div class="col-md-6 mb-4">
									<img src="/upload/${recipe.postImageUrl05}"
										alt="Image placeholder" class="img-fluid rounded">
								</div>
								<div class="col-md-6 mb-4">
									<h5>Step5</h5>
									<hr>
									<p>${recipe.cation05}</p>
								</div>
							</div>
							<br>
						</div>
					</c:forEach>
					<!-- 상세 레시피 End -->
				</div>


				<div class="pt-5">
					<p>
						Categories: <a href="#">Food</a>, <a href="#">Fresh</a> Tags: <a
							href="#">#Bread</a>, <a href="#">#healthy</a>
					</p>
				</div>

				<!-- 댓글 Start -->

				<!-- 댓글 Comment -->
				<div class="pt-5 comment-wrap"
					style="padding: 10px; margin-bottom: 20px;">
					<h3 class="mb-5 heading">6 Comments</h3>
					<c:forEach var="recipe1" items="${recipe1}">
						<!-- 댓글 달기 -->
						<div class="sl__item__input">
							<input type="text" placeholder="댓글 달기..."
								id="storyCommentInput-${recipe1.id}" class="form-control" />
							<button type="button" onClick="addComment(${recipe1.id})"
								class="btn btn-primary">게시</button>
						</div>
					</c:forEach>
					<%-- <br><br>
					<c:forEach var="mcomment" items="${mcomment}">
					
					<div class="vcard">
                  <ul class="comment-list" id="storyCommentItem-${mcomment.id}">
              <li class="comment">
                <div class="vcard">
                  <img src="/upload/${mcomment.user.profileImageUrl}" alt="유저이미지"
                  onerror="this.src='/images/person.jpeg'">
                </div>
                <div class="comment-body">
                  <h3>${mcomment.user.username}</h3>
                  <div class="meta">${mcomment.createDate}</div>
                  <p>${mcomment.content}</p>
						
						</div>
              		</li>
            	</ul>
                </div>
                
					</c:forEach> --%>
					<br>
					<br>
					<div id="commentList" style="padding: 10px;"></div>
					<!-- END comment-list -->

				</div>
				<!-- 댓글 End -->

			</div>

			<!-- END main-content -->

			<div class="col-md-12 col-lg-4 sidebar">
				<div class="sidebar-box search-form-wrap">
					<h3>레시피 작성자</h3>
					<span>About the writer</span>
				</div>
				<!-- 작성자 정보 Start -->
				<c:forEach var="recipe1" items="${recipe1}">
					<div class="sidebar-box">
						<div class="bio text-center">
							<!-- 작성자 이미지 -->
							<img src="/upload/${recipe1.user.profileImageUrl}"
								alt="Image Placeholder" class="img-fluid2 mb-3"
								onerror="this.src='/images/person.jpeg'">
							<div class="bio-body">
								<h2>${recipe1.user.username}</h2>
								<p class="mb-4">${recipe1.user.bio}</p>
								<p>
									<a href="/user/${recipe1.user.id}"
										class="btn btn-primary btn-sm rounded px-2 py-2">Read my
										bio</a>
								</p>
								<p class="social">
									<a href="#" class="p-2"><span class="fa fa-facebook"></span></a>
									<a href="#" class="p-2"><span class="fa fa-twitter"></span></a>
									<a href="#" class="p-2"><span class="fa fa-instagram"></span></a>
									<a href="#" class="p-2"><span class="fa fa-youtube-play"></span></a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 작성자 정보 End -->
				<div class="sidebar-box">
					<h3 class="heading">요리 가이드</h3>
					<div class="post-entry-sidebar">
						<ul>
							<li><a href=""> <img src="/images/달걀.PNG"
									alt="Image placeholder" class="me-4 rounded">
									<div class="text">
										<h4>삶은 달걀 쉽게 까는 법</h4>
										<div class="post-meta">
											<span class="mr-2">내안의, 매니저</span>
										</div>
									</div>
							</a></li>
							<li><a href=""> <img src="/images/양배추.PNG"
									alt="Image placeholder" class="me-4 rounded">
									<div class="text">
										<h4>양배추 야무지게 먹는 방법</h4>
										<div class="post-meta">
											<span class="mr-2">내안의, 매니저</span>
										</div>
									</div>
							</a></li>
							<li><a href=""> <img src="/images/마늘.PNG"
									alt="Image placeholder" class="me-4 rounded">
									<div class="text">
										<h4>다진마늘 쉽게 보관하는 법</h4>
										<div class="post-meta">
											<span class="mr-2">내안의, 매니저 </span>
										</div>
									</div>
							</a></li>
						</ul>
					</div>
				</div>
				<!-- END sidebar-box -->

				<div class="sidebar-box">
					<h3 class="heading">Categories</h3>
					<ul class="categories">
						<li><a href="#">고기 <span>(12)</span></a></li>
						<li><a href="#">채소류 <span>(22)</span></a></li>
						<li><a href="#">해산물 <span>(06)</span></a></li>
						<li><a href="#">유제품 / 계란 <span>(10)</span></a></li>
						<li><a href="#">과일 <span>(14)</span></a></li>
					</ul>
				</div>
				<!-- END sidebar-box -->
			</div>
			<!-- END sidebar -->

		</div>
	</div>
</section>

<!-- Preloader -->
<div id="overlayer"></div>
<div class="loader">
	<div class="spinner-border text-primary" role="status">
		<span class="visually-hidden">Loading...</span>
	</div>
</div>

<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/tiny-slider.js"></script>

<script src="/js/flatpickr.min.js"></script>


<script src="/js/aos.js"></script>
<script src="/js/glightbox.min.js"></script>
<script src="/js/navbar.js"></script>
<script src="/js/counter.js"></script>
<script src="/js/custom.js"></script>

<!-- Content End -->

<script src="/js/recipe.js"></script>

<%@ include file="../main/footer.jsp"%>