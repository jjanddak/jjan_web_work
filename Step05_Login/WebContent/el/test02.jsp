<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>EL testing...........</h3>
<%
	UsersDto dto=(UsersDto)request.getAttribute("dto");
%>
<p> 
	아이디 : <strong><%=dto.getId() %></strong>
	이메일 : <strong><%=dto.getEmail() %></strong>
	등록일 : <strong><%=dto.getRegdate() %></strong>
</p>

<%--위 코드를 EL 을 이용한다면 --%>

<p>
	아이디 : <strong>${requestScope.dto.id }</strong>
	이메일 : <strong>${requestScope.dto.email }</strong>
	등록일 : <strong>${requestScope.dto.regdate }</strong>
</p>
</body>
</html>