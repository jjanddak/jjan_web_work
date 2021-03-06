<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//1. 폼전송되는 글정보
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//2. DB 에 수정반영하기
	CafeDto dto=new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess=CafeDao.getInstance().update(dto);
	
	request.setAttribute("num", num);
	request.setAttribute("isSuccess", isSuccess);
	//3. 응답.
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess eq true }">
			<script>
				alert("글을 수정했습니다!")
				location.href="${pageContext.request.contextPath }/cafe/detail.jsp?num=${num}";
			</script>
		</c:when>
		<c:otherwise>
			<h1>ALERT!</h1>
			<p class="alert alert-danger">
				 수정 실패!
			<a class="alert-link" href="updateform.jsp?num=${num }">다시시도</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>