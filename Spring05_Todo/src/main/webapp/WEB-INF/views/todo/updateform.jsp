<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>회원정보 수정</h1>
	<form action="update.do" method="post">
		<div>
			<input type="hidden" name="num"	value="${dto.num }" />
		</div>
		<div>
			<label for="content">할일</label>
			<input type="text" id="content" name="content" value="${dto.content}"/>
		</div>
		<button class="btn btn-warning" type="submit">수정</button>
		<button type="reset">취소</button>
	</form>	
</div>
</body>
</html>