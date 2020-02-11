<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATA ACCESS EXCEPTION</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<div class="container">
	<h1>DB 관련 예외 발생!</h1>
	<p class="alert alert-danger">${exception.message }</p>
	<a href="${pageContext.request.contextPath }/home.do">인덱스로</a>
</div>
</body>
</html>