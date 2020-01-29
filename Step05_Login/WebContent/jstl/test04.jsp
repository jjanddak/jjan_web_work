<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>this is test 04 again.........</title>
</head>
<body>
<%
	request.setAttribute("size", 123456789);
	request.setAttribute("weight", 1234.56789);
	request.setAttribute("price", 1250000);
%>
<h3>JSTL fmt TESTING....</h3>
<p> size : <strong>${size }</strong> byte</p>
<p> size : <strong><fmt:formatNumber value="${size }"/></strong> byte</p>
<p> weight : <strong>${weight }</strong></p>
<p> weight : <strong><fmt:formatNumber value="${weight }" pattern="#,###.##"/></strong></p>
<p> labtop : <strong>${price}</strong></p>
<p> labtop : <strong><fmt:formatNumber value="${price}" type="currency" currencySymbol="$"/></strong></p>
</body>
</html>