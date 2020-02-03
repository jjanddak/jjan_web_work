<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	th,td{
		border: 3px solid blue;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<div class="container">
	<h1>검색결과 페이지</h1>
	<h3>${query }에 대한 검색결과</h3>
	<p>${list[0] }</p>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>할일</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.content }</td>
					<td>${tmp.regdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="list.do">목록으로</a>
</div>
</body>
</html>