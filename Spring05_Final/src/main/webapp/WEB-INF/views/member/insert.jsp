
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
<div class="container">
	<h1>Alert !</h1>
	<p><strong>${dto.name }</strong> 님의 정보를 추가했습니다.</p>
	<a href="${pageContext.request.contextPath }/member/list.do">목록으로</a>
</div>
</body>
</html>