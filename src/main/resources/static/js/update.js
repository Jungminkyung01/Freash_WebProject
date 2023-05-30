

// (1) 회원정보 수정
function update(userId, event) {
	event.preventDefault(); // 폼태그 액션을 막기!!
	
	let data = $("#profileUpdate").serialize(); // key=value
	
	console.log(data);
	
	$.ajax({
		type: "put",
		url : `/api/user/${userId}`,
		data: data,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json"
	}).done(res=>{ // HttpStatus 상태코드 200번대
		console.log("성공", res);
		location.href = `/user/${userId}`;
	}).fail(error=>{ // HttpStatus 상태코드 200번대가 아닐 때
		if(error.data == null){
			alert(error.responseJSON.message);
		}else{
			alert(JSON.stringify(error.responseJSON.data));	
		}	
	});
}

// (2) 레시피 수정
function update2(id, event) {
	event.preventDefault(); // 폼태그 액션을 막기!!
	
	let data = $("#recipeUpdate").serialize(); // key=value
	
	console.log(data);
	
	$.ajax({
		type: "put",
		url : `/api/recipe1/${id}`,	
		data: data,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json"
	}).done(res=>{ // HttpStatus 상태코드 200번대
		console.log("성공", res);
		//location.href = `/user/${userId}`;
	}).fail(error=>{ // HttpStatus 상태코드 200번대가 아닐 때
		if(error.data == null){
			alert(error.responseJSON.message);
		}else{
			alert(JSON.stringify(error.responseJSON.data));	
		}	
	});
}



//(3)레시피 삭제
//api/recipe1/delete/29

function deleteRecipe(id) {
	
		$.ajax({
		type: "delete",
		url: "api/recipe1/delete/"+id,
		dataType: "json"
	}).done(function(res){
		alert("삭제가 완료되었습니다.");
		console.log("성공", res);
		location.href="/"
		//$(`#storyDeleteItem-${id}`).remove();
		location.reload();
	}).fail(function(error){
		console.log("오류", error);
	});

	
}


//(4)레시피 수정
var main = {
	    init : function () {
	        var _this = this;
	        $('#btn-update').on('click', function () { _this.update(); });

	    },

	    // ... save, update

	    update : function () {
	        let id = $("#id").val();
	        
	        let data= {
				title:$("#title").val(),
				subtitle:$("#subtitle").val()
				
			};

	        $.ajax({
	            type: 'PUT',
	            url: '/api/update2/'+id,
	            data:JSON.stringify(data),
	            dataType: 'json',
	            contentType:'application/json; charset=utf-8'
	        }).done(function(resp) {
	            alert('수정이 완료되었습니다.');
	            location.href = '/';
	        }).fail(function (error) {
	            alert(JSON.stringify(error));
	        });
	    }
	};

	main.init();
/** 
let index={
	init : function () {
		$('#btn-update').on("click", ()=> {
			 this.update();
			  });
	},
	
	update : function () {
	      let data = {
		title:${"#title"}.val(),
		subtitle:${"#subtitle"}.val()
		};
	        $.ajax({
	            type: 'DELETE',
	            url: '/user/admin/'+id,
	            dataType: 'json',
	        }).done(function(resp) {
	            alert('글이 삭제되었습니다.');
	            window.location.href = '/';
	        }).fail(function (error) {
	            alert(JSON.stringify(error));
	        });
	    }
	
}
*/