<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내안의,냉장고</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="Codrops">
<!-- ICON fork.png / icon_fork.ico -->
<link rel="shortcut icon" href="/images/icon_fork.ico">
<!-- CSS -->
<link rel="stylesheet" href="https://use.typekit.net/yuz0mhb.css">
<link rel="stylesheet" type="text/css" href="/css/index.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
<script>
	document.documentElement.className = "js";

	var supportsCssVars = function supportsCssVars() {
		var e, t = document.createElement("style");
		return t.innerHTML = "root: { --tmp-var: bold; }", document.head
				.appendChild(t),
				e = !!(window.CSS && window.CSS.supports && window.CSS
						.supports("font-weight", "var(--tmp-var)")),
				t.parentNode.removeChild(t), e;
	};

	supportsCssVars()
			|| alert("Please view this demo in a modern browser that supports CSS Variables.");
</script>
<style type="text/css">
:root { 
	--brown: #24221b; 
	--cream: #e4dcc9; 
	--orange: #da9b5b; 
	--gray: #716d6e; 
	--puple: #a197da; 
	--green: #d4da97; 
	--pink: #ce1452;
}

.info {
	align-items: center;
	margin: auto;
}

.one, .two, .three, .four, .five {
	margin: auto;
	height: 50px;
	padding: 0 20px;
	border: 3px solid var(--brown);
	border-radius: 50px;
	display: flex;
	align-items: center;
	font-size: 20px;
	font-weight: bold;
	letter-spacing: 2px;
}

.one:hover {
	background-color: var(--brown);
	color: var(--orange);
}

.one, .two, .three, .four, .five>p {
	margin: 0;
}

.two:hover {
	background-color: var(--brown);
	color: var(--green);
}

.three:hover {
	background-color: var(--brown);
	color: var(--puple);
}

.four:hover {
	background-color: var(--brown);
	color: var(--gray);
}

.five:hover {
	background-color: var(--brown);
	color: var(--pink);
}
</style>
</head>
<body class="demo-1 loading">
	<svg class="hidden">
			<symbol id="icon-arrow" viewBox="0 0 511.996 511.996">
				<title>Arrow left</title>
				<path
			d="M462.51 220.392H172.707l67.017-68.342a7.133 7.133 0 00.014-9.956l-39.544-40.612a7.13 7.13 0 00-10.204 0L44.383 251.028a7.128 7.128 0 000 9.941L189.99 410.514c1.338 1.375 3.176 2.15 5.099 2.15s3.76-.775 5.105-2.15l39.544-40.612a7.126 7.126 0 00-.014-9.956l-67.017-68.342H462.51c3.93 0 7.12-3.19 7.12-7.12v-56.97a7.124 7.124 0 00-7.12-7.122z"></path>
			</symbol>
		</svg>
	<!-- ***** Menu ***** -->

	<main>
		<!-- frame Start -->
		<div class="frame">
			<h1 class="frame__title">내안의, 냉장고</h1>
			<div class="frame__links">
				 <a href="#">Article</a> <a
					href="https://github.com/Jungminkyung01/Freash_WebProject.git">GitHub</a>
			</div>
		</div>
		<!-- frame End -->
		<!-- Menu Image -->
		<div class="bg-gallery-wrap">
			<div class="bg-gallery bg-gallery--1">
				<img class="bg-gallery__item" src="/images/meat01.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/meat02.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/meat04.jpg" alt="Some image">
				<img class="bg-gallery__item" src="/images/meat03.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/meat05.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/meat06.jpg" alt="Some image">
			</div>
			<div class="bg-gallery bg-gallery--2">
				<img class="bg-gallery__item" src="/images/vege05.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/vege02.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/vege01.jpg" alt="Some image">
				<img class="bg-gallery__item" src="/images/vege04.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/vege03.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/vege06.jpg" alt="Some image">
			</div>
			<div class="bg-gallery bg-gallery--3">
				<img class="bg-gallery__item" src="/images/sea01.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/sea02.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/sea04.jpg" alt="Some image">
				<img class="bg-gallery__item" src="/images/sea03.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/sea05.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/sea06.jpg" alt="Some image">
			</div>
			<div class="bg-gallery bg-gallery--4">
				<img class="bg-gallery__item" src="/images/egg02.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/egg01.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/egg03.jpg" alt="Some image">
				<img class="bg-gallery__item" src="/images/egg04.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/egg05.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/egg06.jpg" alt="Some image">
			</div>
			<div class="bg-gallery bg-gallery--5">
				<img class="bg-gallery__item" src="/images/fruit01.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/fruit02.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/fruit03.jpg" alt="Some image">
				<img class="bg-gallery__item" src="/images/fruit04.jpg"
					alt="Some image"> <img class="bg-gallery__item"
					src="/images/fruit05.jpg" alt="Some image"> <img
					class="bg-gallery__item" src="/images/fruit06.jpg" alt="Some image">
			</div>
		</div>
		<!-- Menu -->
		<nav class="menu" id="menu">
			<br>
			<div class="menu__headline">
				<span class="menu__headline-deco"></span> <span
					class="menu__headline-text"> <span><b>현재기온: </b><span
						id="temp">36</span>도</span>
				</span>
			</div>
			<a class="menu__item menu__item--selected" href="#content-1"> <span
				class="menu__item-title">Meat</span> <span class="menu__item-deco">|</span>
				<span class="menu__item-cta"><span>고기류</span></span>
			</a> <a class="menu__item" href="#content-2"> <span
				class="menu__item-title">Vegetables</span> <span
				class="menu__item-deco">|</span> <span class="menu__item-cta"><span>채소류</span></span>
			</a> <a class="menu__item" href="#content-3"> <span
				class="menu__item-title">Seafood</span> <span
				class="menu__item-deco">|</span> <span class="menu__item-cta"><span>해산물</span></span>
			</a> <a class="menu__item" href="#content-4"> <span
				class="menu__item-title">Dairy product/ Egg</span> <span
				class="menu__item-deco">|</span> <span class="menu__item-cta"><span>유제품/계란</span></span>
			</a> <a class="menu__item" href="#content-5"> <span
				class="menu__item-title">Fruit</span> <span class="menu__item-deco">|</span>
				<span class="menu__item-cta"><span>과일</span></span>
			</a>
		</nav>

		<section class="page page--preview">
			<!-- Meat -->
			<div class="content" id="content-1" data-bgcolor="#da9b5b">
				<a class="content__back" href="#menu" aria-label="Back to menu">
					<svg class="icon icon--arrow">
						<use xlink:href="#icon-arrow"></use></svg>
				</a>
				<h2 class="content__title">
					<span>Meat</span>
				</h2>
				<p class="content__intro">
					<span><b>무엇을 먹을지 고민이라면?</b><br>단백질의 주요 공급원 중 하나인 <b>고기</b>는
						인체의 면역력을 키우는데 주요한 역할을 합니다. </span>
				</p>
				<span class="content__date"><span>오늘의, 추천메뉴</span></span>
				
				<div class="gallery">
					<!-- DB에 등록된 레시피 이미지 들어감 -->
					<figure class="gallery__figure">
					<a href="/image/recipe/24" >
						<img class="gallery__figure-img" src="/upload/1f21ed8d-2c08-4b75-8b68-021f00b4052e_시금5.PNG"
							alt="Some image" onerror="/images/meat02.jpg"></a>
						<figcaption class="gallery__figure-caption">시금치통닭</figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/21" >
						<img class="gallery__figure-img" src="/upload/b45c04f8-dbcf-480f-87d7-b497d7366d4b_물갈비.PNG"
							alt="Some image" onerror="/images/meat02.jpg"></a>
						<figcaption class="gallery__figure-caption">산더미 물갈비</figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/18" >
						<img class="gallery__figure-img" src="/upload/76a098ed-1ea3-43cf-a7ea-a4ced9fd42f5_백숙.PNG"
							alt="Some image" onerror="/images/meat02.jpg"></a>
						<figcaption class="gallery__figure-caption">백숙</figcaption>
					</figure>
					<!-- 페이지 이동 (수정 필요) -->
					<div class="info gallery__figure"
						onclick="location.href='/main/main01_M'">
						<div class="one">
							<p>더 알아보러 가기</p>
						</div>
					</div>
				</div>

			</div>

			<!-- /content -->
			<!-- 채소류 -->
			<div class="content" id="content-2" data-bgcolor="#d4da97">
				<a class="content__back" href="#menu" aria-label="Back to menu">
					<svg class="icon icon--arrow">
						<use xlink:href="#icon-arrow"></use></svg>
				</a>
				<h2 class="content__title">
					<span>Vegetables</span>
				</h2>
				<p class="content__intro">
					<span><b>무엇을 먹을지 고민이라면?</b><br> <b>채소</b>는 칼로리와 탄수화물이
						적고 섬유질, 비타민, 미네랄 및 질병과 싸우는 식물화학물질이 풍부합니다. </span>
				</p>
				<span class="content__date"><span>오늘의, 추천메뉴</span></span>
				<div class="gallery">
					<figure class="gallery__figure">
					<a href="/image/recipe/22" >
						<img class="gallery__figure-img" src="/upload/f0ef01c3-6df0-4fbf-be56-d763e1904bb1_전골.PNG"
							alt="Some image" onerror="/images/vege05.jpg"></a>
						<figcaption class="gallery__figure-caption">채소 전골 </figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/3" >
						<img class="gallery__figure-img" src="/upload/7d19b1a3-2367-4133-81f1-d15e2af4421f_비건통밀빵.PNG"
							alt="Some image" onerror="/images/vege05.jpg"></a>
						<figcaption class="gallery__figure-caption"> 비건 통밀빵</figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/1" >
						<img class="gallery__figure-img" src="/upload/db6799d6-28da-442d-aa89-a4bb13156157_단호박1.PNG"
							alt="Some image" onerror="/images/vege05.jpg"></a>
						<figcaption class="gallery__figure-caption">비건 단호박 파운드케이크 </figcaption>
					</figure>

					<div class="info gallery__figure"
						onclick="location.href='/main/main02_V'">
						<div class="two">
							<p>더 알아보러 가기</p>
						</div>
					</div>

				</div>
			</div>
			<!-- /content -->
			<!-- 해산물 -->
			<div class="content" id="content-3" data-bgcolor="#a197da">
				<a class="content__back" href="#menu" aria-label="Back to menu">
					<svg class="icon icon--arrow">
						<use xlink:href="#icon-arrow"></use></svg>
				</a>
				<h2 class="content__title">
					<span>Seafood</span>
				</h2>
				<p class="content__intro">
					<span><b>무엇을 먹을지 고민이라면?</b><br> <b>해산물</b>을 즐겨먹으면 심장병,
						고혈압등 예방에 도움이 되고 간기능 향상, 골다공증 예방등에 도움이 된다.</span>
				</p>
				<span class="content__date"><span>오늘의, 추천메뉴</span></span>
				<div class="gallery">
					<figure class="gallery__figure">
					<a href="/image/recipe/19" >
						<img class="gallery__figure-img" src="/upload/9f17c240-3c17-45f4-a86e-0be3d61b1ea7_고등어.PNG"
							alt="Some image" onerror="/images/sea02.jpg"></a>
						<figcaption class="gallery__figure-caption"> 고등어조림</figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/14" >
						<img class="gallery__figure-img" src="/upload/320280b6-7b24-4d1d-a003-f12c78149c19_리조.PNG"
							alt="Some image" onerror="/images/sea02.jpg"></a>
						<figcaption class="gallery__figure-caption">나폴리풍 해산물 리소토 </figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/12" >
						<img class="gallery__figure-img" src="/upload/d820327f-f9b2-4552-895e-7df2b540dbfd_연어.PNG"
							alt="Some image" onerror="/images/sea02.jpg"></a>
						<figcaption class="gallery__figure-caption">연어 그라브락스 </figcaption>
					</figure>

					<div class="info gallery__figure"
						onclick="location.href='/main/main03_S'">
						<div class="three">
							<p>더 알아보러 가기</p>
						</div>
					</div>

				</div>
			</div>
			<!-- /content -->
			<!-- 유제품/계란 -->
			<div class="content" id="content-4" data-bgcolor="#716d6e">
				<a class="content__back" href="#menu" aria-label="Back to menu">
					<svg class="icon icon--arrow">
						<use xlink:href="#icon-arrow"></use></svg>
				</a>
				<h2 class="content__title">
					<span>Dairy product/ Egg</span>
				</h2>
				<p class="content__intro">
					<span><b>무엇을 먹을지 고민이라면?</b><br> 사람들은 <b>유제품</b> 섭취를 통해
						신체에 필수적인 칼슘, 마그네슘등의 섭취를 돕고 성인 및 아동 식단에서 칼슘, 비타민D, 칼륨의 최고 공급원으로
						자리잡고 있습니다.</span>
				</p>
				<span class="content__date"><span>오늘의, 추천메뉴</span></span>
				<div class="gallery">
					<figure class="gallery__figure">
					<a href="/image/recipe/25" >
						<img class="gallery__figure-img" src="/upload/2c42d83e-4707-442c-ae6d-94c23f33d148_루6.PNG"
							alt="Some image" onerror="/images/egg02.jpg"></a>
						<figcaption class="gallery__figure-caption">크로핀 </figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/11" >
						<img class="gallery__figure-img" src="/upload/dd8086cc-3e56-4d85-a02d-66faedf86b2d_푸딩.PNG"
							alt="Some image" onerror="/images/egg02.jpg"></a>
						<figcaption class="gallery__figure-caption">두유 푸딩</figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/7" >
						<img class="gallery__figure-img" src="/upload/1974951c-c71c-4f0a-afb5-b607a5230912_두부.PNG"
							alt="Some image" onerror="/images/egg02.jpg"></a>
						<figcaption class="gallery__figure-caption">두부 치즈 토스트 </figcaption>
					</figure>

					<div class="info gallery__figure"
						onclick="location.href='/main/main04_P'">
						<div class="four">
							<p>더 알아보러 가기</p>
						</div>
					</div>

				</div>
			</div>
			<!-- /content -->
			<!-- 과일 -->
			<div class="content" id="content-5" data-bgcolor="#ce1452">
				<a class="content__back" href="#menu" aria-label="Back to menu">
					<svg class="icon icon--arrow">
						<use xlink:href="#icon-arrow"></use></svg>
				</a>
				<h2 class="content__title">
					<span>Fruit</span>
				</h2>
				<p class="content__intro">
					<span><b>무얼 먹을지 고민이라면?</b><br> <b>과일</b>을 꾸준히 섭취하면
						생활습관병과 암 예방에 도움이 되며, 비타민의 항산화, 피부미용등에 도움이 된다. </span>
				</p>
				<span class="content__date"><span>오늘의, 추천메뉴</span></span>
				<div class="gallery">
					<figure class="gallery__figure">
					<a href="/image/recipe/15" >
						<img class="gallery__figure-img" src="/upload/ccf62014-1a63-4ffe-b06d-3c0315b43b57_타르트.PNG"
							alt="Some image" onerror="/images/fruit01.jpg"></a>
						<figcaption class="gallery__figure-caption">비건 레몬 청포도 타르트 </figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/9" >
						<img class="gallery__figure-img" src="/upload/4590962f-dad9-4ef7-893b-894df54162b1_패션.PNG"
							alt="Some image" onerror="/images/fruit01.jpg"></a>
						<figcaption class="gallery__figure-caption">파인애플 패션후르츠 청 </figcaption>
					</figure>
					<figure class="gallery__figure">
					<a href="/image/recipe/5" >
						<img class="gallery__figure-img" src="/upload/0a86a29f-ccfd-4fbe-a60c-d9dfe6a0ed3a_딸기.PNG"
							alt="Some image" onerror="/images/fruit01.jpg"></a>
						<figcaption class="gallery__figure-caption"> 딸기 뚱 베이글</figcaption>
					</figure>

					<div class="info gallery__figure"
						onclick="location.href='/main/main05_F'">
						<div class="five">
							<p>더 알아보러 가기</p>
						</div>
					</div>

				</div>
			</div>
			<!-- /content -->
		</section>
		<!-- /page -->
	</main>
	<svg class="cursor" width="30" height="30" viewBox="0 0 30 30">
			<circle class="cursor__inner" cx="15" cy="15" r="7.5"></circle>
		</svg>
	<script src="/js/index.js"></script>
</body>
</html>