<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<div class="container">
	<h1>500</h1>
	<p class="alert alert-danger">
		요청 처리중 오류가 발생했습니다
		<a href="${pageContext.request.contextPath }/home.do">확인</a>
	</p>
</div>
</body>
</html>