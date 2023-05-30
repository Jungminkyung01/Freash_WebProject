/** 
(1) 채소
(1-1) 채소 좋아요
(2) 고기
(3) 해산물
(4) 유제품
(5) 과일
*/

//(1)메인스토리 로드하기
function mainStoryLoad(){
	//방식은 Get인데 고정으로 들어간 값이기 때문에 
	//따로 작성해 줄 필요는 없다.
	$.ajax({
		url:`/api/main`,
		dataType:"json"
	}).done(res=>{
		console.log(res);
		res.data.forEach((image)=>{
			let mainItem = getMainItem(image);
			$("#mainList").append(mainItem);
			
		});
	}).fail(error=>{
		console.log("오류",error);
	});
}

mainStoryLoad();

// <a href="/image/recipe/${image.id}" class="img-link">
//(2)메인스토리에 이미지 넣어주기
function getMainItem(image){
	let item = `
				<div class="col-lg-4 mb-4">
						<div class="post-entry-alt">
								<a href="/image/recipe/${image.id}" class="img-link"> <img
									src="/upload/${image.postImageUrl}"
									onerror="this.src='/images/person.jpeg'" alt="Image"
									class="img-fluid">
								</a>
								
	<!-- 좋아요 Start -->							
	<div class="sl__item__contents">
		<div class="sl__item__contents__icon">

			<button>`;
			     
			     if(image.likeState){
					item += `<i class="fas fa-heart active" id="storyLikeIcon-${image.id}" onclick="toggleLike(${image.id})"></i>`;
				}else{
					item += `<i class="far fa-heart" id="storyLikeIcon-${image.id}" onclick="toggleLike(${image.id})"></i>`;
				}
				
		
		item += `
			</button>
		</div>

		<span class="like"><b id="storyLikeCount-${image.id}">${image.likeCount} </b>likes</span>
		<!-- 좋아요 End -->	
								
								<div class="excerpt">
									<h5>
										<a href="single.html">${image.title}</a>
									</h5>
									<div class="post-meta align-items-center text-left clearfix">
										<figure class="author-figure mb-0 me-3 float-start">
											<img src="/upload/${image.user.profileImageUrl}"
												onerror="this.src='/images/person.jpeg'" alt="Image"
												class="img-fluid">
										</figure>
										<span class="d-inline-block mt-1">By <a href="#">${image.user.username}</a></span>
										<span></span>
									</div>

									<span>난이도: ${image.difficult}</span> <span
										style="display: inline-block; margin: 0 5px; float: right;">조리시간: ${image.cookTime}</span>

								</div>
							</div>								
						</div>`;
	return item;
}


// (3) 좋아요, 안좋아요
function toggleLike(imageId) {
	let likeIcon = $(`#storyLikeIcon-${imageId}`);
	
	if (likeIcon.hasClass("far")) { // 좋아요 하겠다
		
		$.ajax({
			type: "post",
			url: `/api/main/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) + 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.addClass("fas");
			likeIcon.addClass("active");
			likeIcon.removeClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		
		

	} else { // 좋아요취소 하겠다
		
		$.ajax({
			type: "delete",
			url: `/api/main/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) - 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.removeClass("fas");
			likeIcon.removeClass("active");
			likeIcon.addClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		

	}
}

//(01)고기 api/main01_M 로드하기
//(1)메인스토리 로드하기
function mainStory01Load(){
	//방식은 Get인데 고정으로 들어간 값이기 때문에 
	//따로 작성해 줄 필요는 없다.
	$.ajax({
		url:`/api/main01_M`,
		dataType:"json"
	}).done(res=>{
		console.log(res);
		res.data.forEach((image)=>{
			let mainMeatItem = getMainMeatItem(image);
			$("#mainMeatList").append(mainMeatItem);
		});
	}).fail(error=>{
		console.log("오류",error);
	});
}

mainStory01Load();
///api/image?page=${page}
//(2)메인스토리에 이미지 넣어주기
function getMainMeatItem(image){
	let meat_item = `
				<div class="col-lg-4 mb-4">
						<div class="post-entry-alt">
								<a href="/image/recipe/${image.id}" class="img-link"> <img
									src="/upload/${image.postImageUrl}"
									onerror="this.src='/images/person.jpeg'" alt="Image"
									class="img-fluid"></a>
									
	<!-- 좋아요 Start -->							
	<div class="sl__item__contents">
		<div class="sl__item__contents__icon">

			<button>`;
			     
			     if(image.likeState){
					meat_item += `<i class="fas fa-heart active" id="storyLikeMIcon-${image.id}" onclick="MtoggleLike(${image.id})"></i>`;
				}else{
					meat_item += `<i class="far fa-heart" id="storyLikeMIcon-${image.id}" onclick="MtoggleLike(${image.id})"></i>`;
				}
				
		
		meat_item += `
			</button>
		</div>

		<span class="like"><b id="storyLikeCount-${image.id}">${image.likeCount} </b>likes</span>
		<!-- 좋아요 End -->
									
								<div class="excerpt">
									<h5>
										<a href="single.html">${image.title}</a>
									</h5>
									<div class="post-meta align-items-center text-left clearfix">
										<figure class="author-figure mb-0 me-3 float-start">
											<img src="/upload/${image.user.profileImageUrl}"
												onerror="this.src='/images/person.jpeg'" alt="Image"
												class="img-fluid">
										</figure>
										<span class="d-inline-block mt-1">By <a href="#">${image.user.username}</a></span>
										<span></span>
									</div>

									<span>난이도: ${image.difficult}</span> <span
										style="display: inline-block; margin: 0 5px; float: right;">조리시간: ${image.cookTime}</span>

								</div>
							</div>								
						</div>`;
	return meat_item;
}

// (3) 좋아요, 안좋아요
function MtoggleLike(imageId) {
	let likeIcon = $(`#storyLikeMIcon-${imageId}`);
	
	if (likeIcon.hasClass("far")) { // 좋아요 하겠다
		
		$.ajax({
			type: "post",
			url: `/api/main01_M/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) + 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.addClass("fas");
			likeIcon.addClass("active");
			likeIcon.removeClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		
		

	} else { // 좋아요취소 하겠다
		
		$.ajax({
			type: "delete",
			url: `/api/main01_M/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) - 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.removeClass("fas");
			likeIcon.removeClass("active");
			likeIcon.addClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		

	}
}

//(03)해산물 api/main03_S 로드하기
//(1)메인스토리 로드하기
function mainStory03Load(){
	$.ajax({
		url:`/api/main03_S`,
		dataType:"json"
	}).done(res=>{
		console.log(res);
		res.data.forEach((image)=>{
			let mainSeaItem = getMainSeaItem(image);
			$("#mainSeaList").append(mainSeaItem);
		});
	}).fail(error=>{
		console.log("오류",error);
	});
}

mainStory03Load();

//(3)해산물 스토리에 이미지 넣어주기
function getMainSeaItem(image){
	let sea_item = `
				<div class="col-lg-4 mb-4">
						<div class="post-entry-alt">
								<a href="/image/recipe/${image.id}" class="img-link"> <img
									src="/upload/${image.postImageUrl}"
									onerror="this.src='/images/person.jpeg'" alt="Image"
									class="img-fluid"></a>
									
<!-- 좋아요 Start -->							
	<div class="sl__item__contents">
		<div class="sl__item__contents__icon">

			<button>`;
			     
			     if(image.likeState){
					sea_item += `<i class="fas fa-heart active" id="storyLikeSIcon-${image.id}" onclick="StoggleLike(${image.id})"></i>`;
				}else{
					sea_item += `<i class="far fa-heart" id="storyLikeSIcon-${image.id}" onclick="StoggleLike(${image.id})"></i>`;
				}
				
		
		sea_item += `
			</button>
		</div>

		<span class="like"><b id="storyLikeCount-${image.id}">${image.likeCount} </b>likes</span>
		<!-- 좋아요 End -->
									
								<div class="excerpt">
									<h5>
										<a href="single.html">${image.title}</a>
									</h5>
									<div class="post-meta align-items-center text-left clearfix">
										<figure class="author-figure mb-0 me-3 float-start">
											<img src="/upload/${image.user.profileImageUrl}"
												onerror="this.src='/images/person.jpeg'" alt="Image"
												class="img-fluid">
										</figure>
										<span class="d-inline-block mt-1">By <a href="#">${image.user.username}</a></span>
										<span></span>
									</div>

									<span>난이도: ${image.difficult}</span> <span
										style="display: inline-block; margin: 0 5px; float: right;">조리시간: ${image.cookTime}</span>

								</div>
							</div>								
						</div>`;
	return sea_item;
}

// (3-1) 좋아요, 안좋아요
function StoggleLike(imageId) {
	let likeIcon = $(`#storyLikeSIcon-${imageId}`);
	
	if (likeIcon.hasClass("far")) { // 좋아요 하겠다
		
		$.ajax({
			type: "post",
			url: `/api/main03_S/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) + 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.addClass("fas");
			likeIcon.addClass("active");
			likeIcon.removeClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		
		

	} else { // 좋아요취소 하겠다
		
		$.ajax({
			type: "delete",
			url: `/api/main03_S/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) - 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.removeClass("fas");
			likeIcon.removeClass("active");
			likeIcon.addClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		

	}
}


//(04)유제품 api/main04_P 로드하기
//(1)메인스토리 로드하기
function mainStory04Load(){
	$.ajax({
		url:`/api/main04_P`,
		dataType:"json"
	}).done(res=>{
		console.log(res);
		res.data.forEach((image)=>{
			let mainPItem = getMainPItem(image);
			$("#mainPList").append(mainPItem);
		});
	}).fail(error=>{
		console.log("오류",error);
	});
}

mainStory04Load();

//(4)메인스토리에 이미지 넣어주기
function getMainPItem(image){
	let p_item = `
				<div class="col-lg-4 mb-4">
						<div class="post-entry-alt">
								<a href="/image/recipe/${image.id}" class="img-link"> <img
									src="/upload/${image.postImageUrl}"
									onerror="this.src='/images/person.jpeg'" alt="Image"
									class="img-fluid"></a>
									
	<!-- 좋아요 Start -->							
	<div class="sl__item__contents">
		<div class="sl__item__contents__icon">

			<button>`;
			     
			     if(image.likeState){
					p_item += `<i class="fas fa-heart active" id="storyLikeEggIcon-${image.id}" onclick="PtoggleLike(${image.id})"></i>`;
				}else{
					p_item += `<i class="far fa-heart" id="storyLikeEggIcon-${image.id}" onclick="PtoggleLike(${image.id})"></i>`;
				}
				
		
		p_item += `
			</button>
		</div>

		<span class="like"><b id="storyLikeCount-${image.id}">${image.likeCount} </b>likes</span>
		<!-- 좋아요 End -->
									
								<div class="excerpt">
									<h5>
										<a href="single.html">${image.title}</a>
									</h5>
									<div class="post-meta align-items-center text-left clearfix">
										<figure class="author-figure mb-0 me-3 float-start">
											<img src="/upload/${image.user.profileImageUrl}"
												onerror="this.src='/images/person.jpeg'" alt="Image"
												class="img-fluid">
										</figure>
										<span class="d-inline-block mt-1">By <a href="#">${image.user.username}</a></span>
										<span></span>
									</div>

									<span>난이도: ${image.difficult}</span> <span
										style="display: inline-block; margin: 0 5px; float: right;">조리시간: ${image.cookTime}</span>

								</div>
							</div>								
						</div>`;
	return p_item;
}

// (4-1) 좋아요, 안좋아요
function PtoggleLike(imageId) {
	let likeIcon = $(`#storyLikeEggIcon-${imageId}`);
	
	if (likeIcon.hasClass("far")) { // 좋아요 하겠다
		
		$.ajax({
			type: "post",
			url: `/api/main04_P/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) + 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.addClass("fas");
			likeIcon.addClass("active");
			likeIcon.removeClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		
		

	} else { // 좋아요취소 하겠다
		
		$.ajax({
			type: "delete",
			url: `/api/main04_P/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) - 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.removeClass("fas");
			likeIcon.removeClass("active");
			likeIcon.addClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		

	}
}


//(05)과일 api/main05_F 로드하기
//(1)메인스토리 로드하기
function mainStory05Load(){
	$.ajax({
		url:`/api/main05_F`,
		dataType:"json"
	}).done(res=>{
		console.log(res);
		res.data.forEach((image)=>{
			let mainFruitItem = getMainFruitItem(image);
			$("#mainFruitList").append(mainFruitItem);
		});
	}).fail(error=>{
		console.log("오류",error);
	});
}

mainStory05Load();

//(2)메인스토리에 이미지 넣어주기
function getMainFruitItem(image){
	let f_item = `
				<div class="col-lg-4 mb-4">
						<div class="post-entry-alt">
								<a href="/image/recipe/${image.id}" class="img-link"> <img
									src="/upload/${image.postImageUrl}"
									onerror="this.src='/images/person.jpeg'" alt="Image"
									class="img-fluid"></a>
									
	<!-- 좋아요 Start -->							
	<div class="sl__item__contents">
		<div class="sl__item__contents__icon">

			<button>`;
			     
			     if(image.likeState){
					f_item += `<i class="fas fa-heart active" id="storyLike_FIcon-${image.id}" onclick="FtoggleLike(${image.id})"></i>`;
				}else{
					f_item += `<i class="far fa-heart" id="storyLike_FIcon-${image.id}" onclick="FtoggleLike(${image.id})"></i>`;
				}
				
		
		f_item += `
			</button>
		</div>

		<span class="like"><b id="storyLikeCount-${image.id}">${image.likeCount} </b>likes</span>
		<!-- 좋아요 End -->
									
								<div class="excerpt">
									<h5>
										<a href="single.html">${image.title}</a>
									</h5>
									<div class="post-meta align-items-center text-left clearfix">
										<figure class="author-figure mb-0 me-3 float-start">
											<img src="/upload/${image.user.profileImageUrl}"
												onerror="this.src='/images/person.jpeg'" alt="Image"
												class="img-fluid">
										</figure>
										<span class="d-inline-block mt-1">By <a href="#">${image.user.username}</a></span>
										<span></span>
									</div>

									<span>난이도: ${image.difficult}</span> <span
										style="display: inline-block; margin: 0 5px; float: right;">조리시간: ${image.cookTime}</span>

								</div>
							</div>								
						</div>`;
	return f_item;
}

// (5-1) 좋아요, 안좋아요
function FtoggleLike(imageId) {
	let likeIcon = $(`#storyLike_FIcon-${imageId}`);
	
	if (likeIcon.hasClass("far")) { // 좋아요 하겠다
		
		$.ajax({
			type: "post",
			url: `/api/main05_F/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) + 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.addClass("fas");
			likeIcon.addClass("active");
			likeIcon.removeClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		
		

	} else { // 좋아요취소 하겠다
		
		$.ajax({
			type: "delete",
			url: `/api/main05_F/${imageId}/likes`,
			dataType: "json"
		}).done(res=>{
			
			let likeCountStr = $(`#storyLikeCount-${imageId}`).text();
			let likeCount = Number(likeCountStr) - 1;
			$(`#storyLikeCount-${imageId}`).text(likeCount);
			
			likeIcon.removeClass("fas");
			likeIcon.removeClass("active");
			likeIcon.addClass("far");
		}).fail(error=>{
			console.log("오류", error);
		});
		

	}
}