<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("myName","김구라");
	session.setAttribute("yourName","해골");
	application.setAttribute("ourName","원숭이");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMEeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee</title>
</head>
<body>
<h1>test3 home of test3\/\/\/</h1>
<h1>scope 테스트 test3 home</h1>
<ul>
	<li><a href="other.jsp">다른 페이지로 이동@@@@@@</a></li>
	<li><a href="reset.jsp">삭제하긔</a></li>
</ul>
</body>
</html>