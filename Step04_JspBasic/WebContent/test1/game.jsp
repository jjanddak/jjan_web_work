<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//context 경로 얻기	/Step04_JspBasic
	String cPath=request.getContextPath();
	//강제로 리다이렉트 이동시키기
	//리다이렉트 이동시킬땐 절대경로로 이동시키는것이 일반적.
	//따라서 context 경로가 반드시 필요.
	response.sendRedirect(cPath+"/test1/study.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>game.jsp입니다</title>
</head>
<body>
<h1>gamegamegame</h1>
<p>신나게노라요 노라조 노라라</p>
</body>
</html>