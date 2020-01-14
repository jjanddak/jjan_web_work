<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete 삭제하는페이지ㅣㅣㅣㅣ</title>
</head>
<body>
<%
	//1. 세션의 아이디 읽어오기
	String id=(String)session.getAttribute("id");
	//2. DB에서 삭제
	UsersDao.getInstance().delete(id);
	//3. 로그아웃처리
	session.invalidate();
	//4. 응답.
	
%>
<script>
	alert("회원 탈퇴되었습니다.");
	location.href="${pageContext.request.contextPath }/";
</script>
</body>
</html>