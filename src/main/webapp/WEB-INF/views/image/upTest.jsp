<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<!--상부 컨테이너-->
<h2>UP</h2>
<form name="update" action="${path}/image/update?id=${data.id}">
	<div>번호: ${data.id }</div>
	<div>타이틀:
	<input name="title" value="${data.title }" type="text">
	</div>
	
	<div>
		<input type="submit" class="btn " value="완료">
		<input type="reset" class="btn " value="리셋">
	</div>
</form>
</body>
</html>