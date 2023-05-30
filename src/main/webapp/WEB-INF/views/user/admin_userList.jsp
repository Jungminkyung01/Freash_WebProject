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
 
 .admin_board_wrap, .admin_board_head, .admin_board_content_nm,.admin_board_content{
 	margin: 10px;
 	padding: 10px;
 }
 
 
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
	<h2>회원관리</h2>
		<div class="member_list" >
        <table class="admin_board_wrap" id="user-admin">
          <thead class="admin_boardList">
            <th class="admin_board_head">이름</th>
            <th class="admin_board_head">아이디</th>
            <th class="admin_board_head">가입일</th>
            <th class="admin_board_head">이메일</th>
            <th class="admin_board_head">회원관리</th>
          </thead>
          <tbody>
          <c:forEach var="vo" items="${userInfo}">
            <tr class="admin_board_content">
              <td class="admin_board_content_nm"><a class="mypageModal user_id" value="${vo.id}">${vo.name}</a> </td>
              <td class="admin_board_content_nm">${vo.username}</td>
              <td class="admin_board_content_nm">${vo.createDate}</td>
				<td class="admin_board_content_nm">${vo.email}</td>
			<td>
			&nbsp;&nbsp;<a href="/user/admin_userList/${vo.id}" data-user-id ="${vo.id}" type="button" value="회원삭제"
			 onclick="alert('회원을 삭제하시겠습니까?');">회원삭제</a>
			</td>
            </tr>
            
            </c:forEach>
          </tbody>
        </table>
        </div>
	</div>

</section>
<%@ include file="../main/footer.jsp"%>