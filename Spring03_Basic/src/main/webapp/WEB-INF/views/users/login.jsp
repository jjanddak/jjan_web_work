<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
</head>
<body>
<h1>Alert!</h1>
<c:choose>
	<c:when test="${isValid }">
		<p><strong>${id }</strong>님 로그인 되었습니다.</p>	
		<a href="${pageContext.request.contextPath }/">확인</a>
	</c:when>
	<c:otherwise>
		<h2>로그인 실패.......</h2>
		<p>
			아이디 혹은 비밀번호가 틀렸스빈담
		</p>
		<a href="${pageContext.request.contextPath }/users/loginform.do">확인</a>
	</c:otherwise>
</c:choose>
</body>
</html>