<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 세션에서 로그인된 아이디 정보를 읽어옴
	String id=(String)session.getAttribute("id");
	//2. DB에서 해당 아이디의 정보를 얻기.
	UsersDto dto=UsersDao.getInstance().getData(id);
	//3. 개인정보를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOUR INFO</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>개인정보 페이지</h1>
	<table class="table table-striped table-condensed">
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a href="updateform.jsp"><button class="btn btn-primary">개인정보 수정하기</button></a>
	<a href="javascript:deleteConfirm()"><button class="btn btn-danger">회원탈퇴</button></a>
</div>
<script>
	function deleteConfirm(){
		var isDelete=confirm("<%=id%>님 탈퇴하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>