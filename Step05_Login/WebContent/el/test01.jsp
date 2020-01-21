<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>el 테스트........테스팅........</h3>
<%
	String myName=(String)request.getAttribute("myName");
	
%>
<p> myName : <strong><%=myName %></strong></p>
<p> myName : <strong>${requestScope.myName }</strong></p>
</body>
</html>