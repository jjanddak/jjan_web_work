<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateformm.jsp</title>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	// id를 이용해서 가입정보 얻어오기
	UsersDto dto=UsersDao.getInstance().getData(id);
%>
<div class="container">
	<h1>회원정보 수정</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="id" value="<%=id %>" />
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" value="<%=id %>" />
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="text" id="email" name="email" 
			value="<%=dto.getEmail() %>" />
		</div>
		<button type="submit">수정확인</button>
		<button type="reset">취소</button>
	</form>
	<a href="pwd_updateform.jsp">비밀번호 수정하기</a>
</div>
</body>
</html>