<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	//1. 폼전송되는 파라미터 (글제목, 내용)	
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String writer=(String)session.getAttribute("id");
	
	CafeDto dto=new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	//2. DB에 글정보 저장
	boolean isSuccess=CafeDao.getInstance().insert(dto);
	request.setAttribute("isSuccess", isSuccess);
	//3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inserrt</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess eq true }">
			<script>
				alert("작성완료!");
				location.href="${pageContext.request.contextPath }/cafe/list.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<h1>저장실패!</h1>
			<p class="alert alert-danger">
				<a class="alert-link" href="insertform.jsp">다시작성하기</a>;
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>