<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inserttttttttttttttt</title>
</head>
<body>
<h1>INSERT JSPPP EPPE</h1>
<%
	//post 방식 파라미터 읽기
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
%>
<p>이름 : <strong><%=name %></strong></p>
<p>주소 : <strong><%=addr %></strong></p>

</body>
</html>