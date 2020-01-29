<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		jsp에서 기본제공 객체
		httpservletrequest, httpsession, servletcontext
		type 객체가 있음
		해당객체 참조값은
		request, session, application 이라는 이름의 지역변수에 들ㅇ감
		때로는 ㅓ떤data를 각각의 객체에 저장하고 읽어낼 필요가있다....
	*/
	
	//request에 담긴 String type 얻어내기
	String myName=(String)request.getAttribute("myName");
	String yourName=(String)session.getAttribute("yourName");
	String ourName=(String)application.getAttribute("ourName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>myName : <strong><%=myName %></strong></p>
	<p>yourName : <strong><%=yourName %></strong></p>
	<p>ourName : <strong><%=ourName %></strong></p>
</body>
</html>