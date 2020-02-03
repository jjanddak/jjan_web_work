<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할일목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	td,tr,th{
		border: 1px solid orange;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<div class="container">
	<h1>할일 목록 (TODO LIST)</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>할일</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.content }</td>
					<td>${tmp.regdate }</td>
					<td><a href="updateform.do?num=${tmp.num }">수정</a></td>
					<td><a href="delete.do?num=${tmp.num }">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href="insertform.do">할일 추가</a>
	
	<form action="search.do" method="post">
		<label for="query">제목 검색</label>
		<input type="text" id="query" name="query"/>
		<button class="btn btn-info" type="submit">검색</button>
	</form>
</div>
</body>
</html>