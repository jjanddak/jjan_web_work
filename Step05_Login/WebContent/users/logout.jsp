<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//session.removeAttribute("id");
	session.invalidate(); //세션초기화
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="${pageContext.request.contextPath }/index.jsp";
</script>
</body>
</html>