<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼ㄴ전송 ㅍㅏ라미터
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//checkbox를 체크했는지 (체크안하면 null)
	String isSave=request.getParameter("isSave");
	if(isSave!=null){
		//아이디를 쿠키로 저장
		Cookie idCook=new Cookie("savedId",id);
		Cookie pwdCook=new Cookie("savedPwd",pwd);
		//테스트이므로 60초만 유지되도록.
		idCook.setMaxAge(60);
		pwdCook.setMaxAge(60);
		//응답객체(HttpServletResponse)를 이용해 쿠키도응답
		response.addCookie(idCook);
		response.addCookie(pwdCook);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>louis vuitton</title>
</head>
<body>
	<p><strong><%=id %></strong> 님 로그인 되었습니다</p>
	<a href="test2.jsp">로그인폼으로 돌아가기</a>
</body>
</html>