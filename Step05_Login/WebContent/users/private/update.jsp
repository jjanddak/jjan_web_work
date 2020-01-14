<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼전송되는 아이디와 이메일을  읽어와서
	String id=request.getParameter("id");
	String email=request.getParameter("email");
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	//2. DB에 수정반영하고
	boolean isSuccess=UsersDao.getInstance().update(dto);
	//3. 응답하기.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsppppppllplpplplpl</title>
</head>
<body>
<div class="container">
	<%if(isSuccess) {%>
		<script>
			alert("회원정보 수정됨");
			location.href="info.jsp";
		</script>
	<%}else { %>
		<h1>Alert</h1>
		<p>회원정보 수정 실패!</p>
		<a href="updateform.jsp">다시시도 하기</a>
	<%} %>
</div>
</body>
</html>