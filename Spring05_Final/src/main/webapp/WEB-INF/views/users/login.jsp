<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
			<p>
				<strong>${id} 님 환영합니다</strong>
				<a href="${url}">확인</a>
			</p>
		</c:when>
		<c:otherwise> 
			<p>
				아이디 혹은 비밀번호가 다릅니다...
				<a href="login_form.do?url=${encodedUrl}">다시 로그인</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>