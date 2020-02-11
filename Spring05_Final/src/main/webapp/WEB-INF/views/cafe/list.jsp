<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록!</title>
<jsp:include page="../include/resource.jsp"/>
<style>
	td,tr,th{
		border: 1px solid purple;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="category"></jsp:param>
</jsp:include>
<div class="container">
	<h1>게시판</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td>${tmp.title }</td>
					<td>${tmp.viewCount }</td>
					<td>${tmp.regdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="insertform.do">글쓰기</a>
	
	<form action="search.do" method="post">
		<label for="query">제목 검색</label>
		<input type="text" id="query" name="query"/>
		<button class="btn btn-info" type="submit">검색</button>
	</form>
</div>
</body>
</html>