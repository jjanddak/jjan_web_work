<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	//DB에 저장
	UsersDto dto=new UsersDto(id,pwd,email,null,null);
	/*
	UserDto dto=new UserDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	*/
	UsersDao dao=UsersDao.getInstance();
	
	boolean isSuccess=dao.insert(dto);
	//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>Alert!</h1>
	<%if(isSuccess){ %>
		<p>
			<strong><%=id %></strong>회원님 가입되었습니다
			<a href="login_form.jsp">로그인 하러가기</a>
		</p>
	<%}else { %>
		<p>회원가입 실패!</p>
		<a href="signup_form.jsp">다시시도</a>
	<%} %>
</div>
</body>
</html>