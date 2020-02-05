<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금지금지금지금지</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>금지된 요청</h1>
	<p class="alert alert-danger">
		${msg }<a class="alert-link" href="${pageContext.request.contextPath }/home.do">돌아가기</a>
	</p>
</div>
</body>
</html>