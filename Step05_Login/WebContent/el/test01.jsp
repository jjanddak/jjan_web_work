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
	String num=request.getParameter("num");
%>
<p> myName : <strong><%=myName %></strong></p>
<p> myName : <strong>${requestScope.myName }</strong></p>
<p> num : <strong>${num}</strong></p> <!-- 서블릿이 jsp페이지로 포워드해서 응답을 위임했을 땐 Parameter가 
										전달되지 않는다..?않는것같다-->
</body>
</html>