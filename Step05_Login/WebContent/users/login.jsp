<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//목적지 정보
	String url=request.getParameter("url");
	if(url==null){
		url=request.getContextPath()+"/index.jsp";
	}
	//목적지 정보를 미리 인코딩
	String encodedUrl=URLEncoder.encode(url);

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	//DB에서 유효한지 검사
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	boolean isValid=UsersDao.getInstance().isValid(dto);
	
	//유효하면 로그인, 아니면 다시시도 하도록하기
	if(isValid){
		//로그인 되었다는 의미에서 session에 "id"라는 키값으로 저장
		session.setAttribute("id",id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<%if(isValid){ %>
		<p><strong><%=id %> 님 환영합니다</strong></p>
		<a href="<%=url%>">확인</a>
	<%}else{ %>
		<p>아이디 혹은 비밀번호가 다릅니다...</p>
		<a href="login_form.jsp?url=<%=encodedUrl%>">다시 로그인</a>
	<%} %>
</div>
</body>
</html>