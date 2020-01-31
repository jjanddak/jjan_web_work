<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원추가</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">	
	<h1>회원 추가 페이지</h1>
	<form action="insert.do" method="post">
		<label for="name">이름</label>
		<input type="text" id="name" name="name" /><br/>
		<label for="addr">주소</label>
		<input type="text" id="addr" name="addr" />
		<button class="btn btn-primary" type="submit" >추가</button>
	</form>
</div>
</body>
</html>