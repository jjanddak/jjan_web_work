<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TODO PAGE</title>
</head>
<body>
<h1>TODO LIST</h1>
<ol>
	<c:forEach var="tmp" items="${todo }">
		<li>${tmp }</li><br/>
	</c:forEach>
</ol>
</body>
</html>