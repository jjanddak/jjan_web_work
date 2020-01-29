<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring03_Basic_HOME</title>
</head>
<body>
<h1>INDEX PAGE</h1>
<ul>
	<li><a href="todo/list.do">할일목록보기</a></li>	
	<li><a href="todo/list2.do">할일목록보기2</a></li>	
	<li><a href="todo/list3.do">할일목록보기3</a></li>	
</ul>
<p>lorem.........................................</p>
<h2>공지사항</h2>
<ul>
	<c:forEach var="tmp" items="${notice }">
		<li>${tmp }</li>
	</c:forEach>
</ul>

</body>
</html>