<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록!</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>	
	th,td{
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<div class="container">
	<h1>회원 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.name }</td>
					<td>${tmp.addr }</td>
					<td><a href="delete.do?num=${tmp.num }">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="insertform.do">회원 추가</a>
</div>
</body>
</html>