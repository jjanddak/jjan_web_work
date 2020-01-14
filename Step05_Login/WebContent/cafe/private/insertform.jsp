<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertformAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</title>
</head>
<body>
<%
	//로그인 회원의 아이디 읽기
	String id=(String)session.getAttribute("id");
%>
	<div class="container">
		<h1>새글작성 양식</h1>
		<form action="insert.jsp" method="post">
			<div>
				<label for="writer">작성자</label>
				<input type="text" value="<%=id %>" />
			</div>
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" />
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10"></textarea>
			</div>
			<button type="submit">작성</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>