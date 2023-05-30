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
		관리자 페이지 입니다. 여기서 메뉴를 선택해 주세요!
	</div>

</section>
<%@ include file="../main/footer.jsp"%>