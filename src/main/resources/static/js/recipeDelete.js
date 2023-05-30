//레시피 삭제를 여기에 구현한다.

// (0) 현재 로긴한 사용자 아이디
let principalId = $("#principalId").val();
//(1)레시피 정보 불러오기
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

//(2)버튼을 눌렀을 때, 삭제하기