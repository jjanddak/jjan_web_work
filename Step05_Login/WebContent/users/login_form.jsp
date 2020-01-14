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
	//"url" 파라미터 값(원래 가려던 주소+파라미터)이 넘어오는지 읽어본다.
	String url=request.getParameter("url");
	if(url==null){//없으면
		//로그인 성공후에 index.jspㅔ이지로 보낼수있도록 구성.
		url=request.getContextPath()+"/index.jsp";
	}
%>
<div class="container">
	<h1>로그인 하기</h1>
	<form action="login.jsp" method="post">
		<%--폼 제출할때 목적지 정보도 같이보냄 --%>
		<input type="hidden" name="url" value="<%=url %>" />
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" name="id" />
		</div>
		<div>
			<label for="pwd">패스워드</label>
			<input type="password" id="pwd" name="pwd" />
		</div>
		<button type="submit">로그인</button>
	</form>

</div>
</body>
</html>