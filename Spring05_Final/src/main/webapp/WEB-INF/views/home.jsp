<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME . JSP</title>
<jsp:include page="include/resource.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container">
	<h1>INDEX</h1>
	<ul>
		<li><a href="member/list.do">회원 목록(member table)</a></li>
		<li><a href="file/list.do">자료실(board_file table)</a></li>
	</ul>
	<h2>공지사항</h2>
	<ul>
		<c:forEach var="tmp" items="${notice }">
			<li>${tmp }</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>