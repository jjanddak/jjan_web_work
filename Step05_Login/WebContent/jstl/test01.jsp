<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL core 라이브러리를 c 라는 접두어로 사용할 준비하기 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>JSTL ( Java Standard Tag Library)</h3>
<c:forEach var="i" begin="1" end="5">
	<p>${i }</p>
</c:forEach>

<c:if test="${sessionScope.id==null }">
	<p>로그인을 해야합니다</p>
</c:if>
<c:if test="${empty sessionScope.id}">
	<p>로그인을 해야합니다</p>
</c:if>

<c:if test="${sessionScope.id!=null }">
	<p><strong>${sessionScope.id }</strong>님 로그인됐습니다</p>
</c:if>
<c:if test="${not empty sessionScope.id }">
	<p><strong>${sessionScope.id }</strong>님 로그인됐습니다</p>
</c:if>


</body>
</html>