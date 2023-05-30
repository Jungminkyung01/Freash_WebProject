let index={
	init : function () {
		$('#btn-delete2').on("click", ()=> {
			 this.deleteById();
			  });
	},
	
	deleteById : function () {
	        var id = $('#id').val();

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


var main = {
	    init : function () {
	        var _this = this;
	        $('#btn-save').on('click', function () { _this.save(); });
	        $('#btn-update').on('click', function () { _this.update(); });
	        $('#btn-delete').on('click', function () { _this.delete(); });
	    },

	    // ... save, update

	    delete : function () {
	        var id = $('#id').val();

	        $.ajax({
	            type: 'DELETE',
	            url: '/user/admin/'+id,
	            dataType: 'json',
	            contentType:'application/json; charset=utf-8'
	        }).done(function() {
	            alert('글이 삭제되었습니다.');
	            window.location.href = '/';
	        }).fail(function (error) {
	            alert(JSON.stringify(error));
	        });
	    }
	};

	main.init();
