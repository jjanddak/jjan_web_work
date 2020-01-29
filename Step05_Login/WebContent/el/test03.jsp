<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>EL TESTING.</h3>
<%
	String myNick=(String)session.getAttribute("myNick");
%>

<p>
	닉네임 : <strong><%=myNick%></strong>
</p>
<p>
	닉네밍 : <strong>${sessionScope.myNick }</strong>
</p>
</body>
</html>