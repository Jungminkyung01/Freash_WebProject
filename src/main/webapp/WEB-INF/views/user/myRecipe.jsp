<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<%@ include file="../main/header.jsp"%>
<style>
.banner {
	background-image:
		url("https://images.unsplash.com/photo-1466637574441-749b8f19452f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80");
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
									<h5>등록된 레시피 입니다.</h5>
									<h4>
										<em>Welcome</em> My Recipe
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
							<h2 class="posts-entry-title">등록한 레시피</h2>
						</div>
						<div class="col-sm-6 text-sm-end">
							<a href="#" class="read-more"><b>최신순</b>▼</a>
						</div>
					</div>

					<!-- 레시피 정보 Start -->
					<div class="row">
						<c:forEach var="mrecipe" items="${images}">
							<c:set var="i" value="${i+1 }" />
							
							
							<div class="col-lg-4 mb-4">

								<div class="post-entry-alt"  id="storyDeleteItem-${id}">

									<div>
										<h3>${i }</h3>
									</div>

									<a href="/image/recipe/${mrecipe.id}" class="img-link"> <img
										src="/upload/${mrecipe.postImageUrl}"
										onerror="this.src='/images/person.jpeg'" alt="Image"
										class="img-fluid"></a>
									<div class="excerpt">
										<h5>
											<a href="/image/recipe/${mrecipe.id}">${mrecipe.title} </a>
										</h5>
										<div class="post-meta align-items-center text-left clearfix">
											<figure class="author-figure mb-0 me-3 float-start">
												<img src="/upload/${mrecipe.user.profileImageUrl}"
													onerror="this.src='/images/person.jpeg'" alt="Image"
													class="img-fluid">
											</figure>
											<span class="d-inline-block mt-1">By <a href="#">${mrecipe.user.username}</a>&nbsp;-&nbsp;
											</span> <span class="like"><b
												id="storyLikeCount-${mrecipe.id}">${mrecipe.likes.size()}
											</b>likes</span>
											<!-- 좋아요 개수를 불러올때, ${image.likes.size()}이 방법과 Service에 직접 작성하는 방법이 있다. -->
										</div>

										<span>난이도: ${mrecipe.difficult}</span> <span
											style="display: inline-block; margin: 0 5px; float: right;">조리시간:
											${mrecipe.cookTime}</span>

									</div>

				<c:choose>
					<c:when test="${principal.user.id == mrecipe.user.id}">
					
					<button onclick="location.href='/user/myRecipe/${principal.user.id }/${mrecipe.id}'" >레시피 삭제</button>
				
								<!-- 
								<button onclick="deleteRecipe(${mrecipe.id})" id="recipeDelete">레시피 삭제</button>
								<button onclick="location.href='/image/${mrecipe.id}/update'">레시피 수정</button>
								<a href="/image/upTest?id=${mrecipe.id}" role="button" class="btn">수정</a>
								 -->
								<a href="/image/${mrecipe.id}/upDate2" role="button" class="btn">수정</a>
						</button>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>


									
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
<!--
<script type="text/javascript">
function deleteRecipe(id) {

	
	$.ajax({
	type: "delete",
	url: `api/recipe1/delete/${id}`,
	dataType: "json"
}).done(res=>{
	console.log("성공", res);
	//$(`#storyDeleteItem-${id}`).remove();
	location.reload();
}).fail(error=>{
	console.log("오류", error);
});


}
    </script>
      -->
    
<!-- update라고 적어놓았지만 이 안에 delete버튼이 있음 -->
<script src="/js/update.js"></script>
<script src="/js/story.js"></script>
<%@ include file="../main/footer.jsp"%>

