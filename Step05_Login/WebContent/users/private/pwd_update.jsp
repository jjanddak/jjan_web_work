<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션아이디 읽기
	String id=(String)session.getAttribute("id");
	//폼전송되는 구 비번과 신 비번 읽기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	//아이디와 구비번이용해서 유효성검증 (구비번이 맞는지 여부)
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=UsersDao.getInstance().isValid(dto);
	if(isValid){
		//새 비밀번호 설정
		dto.setPwd(newPwd);
		UsersDao.getInstance().updatePwd(dto);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwd업데이트...........</title>
</head>
<body>
<div class="container">
	<%if(isValid){ %>
		<script>
			alert("비밀번호 수정됨.");
			location.href="info.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("기존 비밀번호가 일치하지 않습니다!");
			location.href="pwd_updateform.jsp";
		</script>
	<%} %>
</div>
</body>
</html>