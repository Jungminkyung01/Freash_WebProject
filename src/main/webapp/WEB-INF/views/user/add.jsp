<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<style>
 body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 

 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

 section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; }
 aside { float:left; width:200px; }
 div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 aside ul li { text-align:center; margin-bottom:10px; }
 
 aside ul li a { display:block; width:100%; padding:10px 0;}
 aside ul li a:hover { background:#eee; }
 
</style>

<div style="padding: 20px;">
<!-- 관리자 -->
<h2>관리자 페이지</h2>
<p> ${principal.user.username}님, 환영합니다.</p>
</div>
<section id="container">
	<aside>
		<%@ include file="../user/aside.jsp" %>
	</aside>
	<div id="container_box">
		<h2>공지사항 등록</h2>
		<br>
		<form action="/user/writedo" method="post" autocomplete="off">

<div class="inputArea">
 <label for="gdsStock">공지사항 제목</label>
 <input type="text" id="title" name="title" style="width: 700px;" />
</div>
<br>
<div class="inputArea">
 <label for="gdsDes">공지사항 내용</label>
 <textarea rows="10" cols="100" id="content1" name="content1"></textarea>
</div>
<br><br>
<div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>

</form>
	</div>

</section>
<%@ include file="../main/footer.jsp"%>