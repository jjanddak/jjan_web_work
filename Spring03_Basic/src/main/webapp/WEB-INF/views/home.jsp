<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring03_Basic_HOME</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>INDEX PAGE</h1>
	<c:if test="${not empty id }">
		<p><strong>${id }</strong>님 환영합니다.</p>
		<a href="users/logout.do">로그아웃하기</a>
	</c:if>
	<ul>
		<li><a href="todo/list.do">할일목록보기</a></li>	
		<li><a href="todo/list2.do">할일목록보기2</a></li>	
		<li><a href="todo/list3.do">할일목록보기3</a></li>	
		<li><a href="users/loginform.do">로그인하기</a></li>
		<li><a href="play.do">회원 전용 공간</a></li>
	</ul>
	<p>lorem.........................................</p>
	<h2>공지사항</h2>
	<ul>
		<c:forEach var="tmp" items="${notice }">
			<li>${tmp }</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>