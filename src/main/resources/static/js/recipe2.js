//날씨
$(document).ready(function () {
        set_temp();
      });
      
      //(1)날씨API
      function set_temp() {
        fetch("http://spartacodingclub.shop/sparta_api/weather/seoul").then((res) => res.json()).then((data) => {
        let temp = data['temp']
        $("#temp").text(temp)
      })
    }
   
      
//(1)/api/step/{imageId}
//(2)/api/step/{id}/recipe
//상세 레시피 불러오기
//** 
/*function recipeLoad(id){
	//방식은 Get인데 고정으로 들어간 값이기 때문에 
	//따로 작성해 줄 필요는 없다.
	$.ajax({
		
		url:`/api/step/${id}`,
		dataType:"json"
	}).done((res)=>{
		console.log(res);
		res.data().then((data) => {
        let recipe = data['recipe']
			$("#recipeList").append(recipe);
		});
	}).fail(error=>{
		console.log("오류",error);
	});
}

recipeLoad();*/


// (0) 현재 로긴한 사용자 아이디
let principalId = $("#principalId").val();

// (1) 댓글 로드하기
function commentLoad() {
	$.ajax({

		url: `/api/image`,
		dataType: "json"
	}).done(res => {
		//console.log(res);
		res.data.content.forEach((image)=>{
			let storyItem = getStoryItem(image);
			$("#commentList").append(storyItem);

		});
	}).fail(error => {
		console.log("오류", error);
	});
}

commentLoad();


function getStoryItem(image) {
	let item = `
	
	<!-- append -->
	<div id="storyCommentList-${image.id}">`;
image.comments.forEach((comment)=> {
	item += `<ul class="comment-list" id="storyCommentItem-${comment.id}">
              <li class="comment">
                <div class="vcard">
                  <img src="/upload/${image.user.profileImageUrl}" alt="유저이미지">
                </div>
                <div class="comment-body">
                  <h3>${comment.user.username}</h3>
                  <div class="meta">${comment.createDate}</div>
                  <p>${comment.content}</p>`;
                  if(principalId == comment.user.id){
						item += `<p onclick="deleteComment(${comment.id})">
						<i class="i reply rounded fas fa-times"></i></p>`;
						}
						item += `
						
						</div>
              		</li>
            	</ul>`;
						});
				item += `</div> `;
       
	return item;
}

//댓글기능
// (4) 댓글쓰기
function addComment(imageId) {

	let commentInput = $(`#storyCommentInput-${imageId}`);
	let commentList = $(`#storyCommentList-${imageId}`);

	let data = {
		imageId: imageId,
		content: commentInput.val()
	}

	//console.log(data);
	//console.log(JSON.stringify(data));

	if (data.content === "") {
		alert("댓글을 작성해주세요!");
		return;
	}
	
	$.ajax({
		type: "post",
		url: "/api/comment",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(res=>{
		//console.log("성공", res);
		
		let comment = res.data;
		
		let content = `
		  <div class="sl__item__contents__comment" id="storyCommentItem-${comment.id}"> 
		  	<div class="vcard">
                  <img src="/upload/${image.user.profileImageUrl}" alt="유저이미지">
                </div>
		    <p>
		      <b>${comment.user.username} :</b>
		      ${comment.content}
		    </p>
		    <button onclick="deleteComment(${comment.id})"><i class="fas fa-times"></i></button>
		  </div>
		`;
		commentList.prepend(content);
	}).fail(error=>{
		console.log("오류", error.responseJSON.data.content);
		alert(error.responseJSON.data.content);
	});

	commentInput.val(""); // 인풋 필드를 깨끗하게 비워준다.
}

// (5) 댓글 삭제
function deleteComment(commentId) {
	$.ajax({
		type: "delete",
		url: `/api/comment/${commentId}`,
		dataType: "json"
	}).done(res=>{
		console.log("성공", res);
		$(`#storyCommentItem-${commentId}`).remove();
	}).fail(error=>{
		console.log("오류", error);
	});
}



// (3) 좋아요, 안좋아요
function toggleLike(imageId) {
	let likeIcon = $(`#storyLikeIcon-${imageId}`);
	
	if (likeIcon.hasClass("far")) { // 좋아요 하겠다
		
		$.ajax({
			type: "post",
			url: `/api/image/${imageId}/likes`,
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
			url: `/api/image/${imageId}/likes`,
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


