<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL TEST 03 TESTINGG................</title>
</head>
<body>
<h3>forTokens 활용</h3>
<%
	String hobby="piano/game/reading";
	request.setAttribute("hobby", hobby);
%>
<ul>
	<c:forTokens var="tmp" items="${hobby }" delims="/">
		<li>${tmp }</li>
	</c:forTokens>
</ul>

<%
	request.setAttribute("num",333);
%>
<h3>choose문을 이용해서 if~else 구조만들기</h3>
<c:choose>
	<c:when test="${num%2 eq 0 }">
		<!-- true -->
		<p><strong>${num }</strong> 은 짝수 입니다.</p>
	</c:when>
	<c:otherwise>
		<!-- else -->
		<p><strong>${num }</strong> 은 홀수 입니다.</p>
	</c:otherwise>
</c:choose>

<%
	request.setAttribute("jumsu", 98);
%>
<h3>choose 문을 이용 다중 if문 구성</h3>
<p>
	획득한 점수는  <strong>${jumsu }</strong>이고
	성적은
	<c:choose>
		<c:when test="${jumsu ge 90 }"><strong>A</strong></c:when>
		<c:when test="${jumsu ge 80 }"><strong>B</strong></c:when>
		<c:when test="${jumsu ge 70 }"><strong>C</strong></c:when>
		<c:when test="${jumsu ge 60 }"><strong>D</strong></c:when>
		<c:otherwise><strong>F</strong></c:otherwise>
	</c:choose> 
	입니다
</p>
</body>
</html>






