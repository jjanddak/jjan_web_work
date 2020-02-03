<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE DUDE</title>
</head>
<body>
<div class="container">
	<h1>Alert !!</h1>
	<p><strong>${dto.num }</strong> 번 할일 수정됨.</p>
	<a href="${pageContext.request.contextPath }/todo/list.do">목록으로</a>
</div>
</body>
</html>