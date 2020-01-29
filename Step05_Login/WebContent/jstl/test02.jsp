<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//model (data)
	List<String> names=new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	
	//request에 담기
	request.setAttribute("names",names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>forEach 활용</h3>
<h4>친구목록</h4>
<ul>
	<c:forEach var="tmp" items="${requestScope.names }"
		varStatus="status">
		<li>
			status.index : <strong>${status.index }</strong><br/>
			status.count : <strong>${status.count}</strong><br/>
			status.first : <strong>${status.first }</strong><br/>
			status.last : <strong>${status.last }</strong><br/>
			friend's name : ${tmp}
		</li><br/>
	</c:forEach>
</ul>
</body>
</html>