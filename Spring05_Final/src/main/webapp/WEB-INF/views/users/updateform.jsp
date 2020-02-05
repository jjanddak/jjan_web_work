<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateformm.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>회원정보 수정</h1>
	<form action="update.do" method="post">
		<input type="hidden" name="id" value="${id }" />
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" value="${id }"  disabled/>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="text" id="email" name="email" 
			value="${dto.email}" />
		</div>
		<button class="btn btn-primary" type="submit">수정확인</button>
		<button class="btn btn-warning" type="reset">취소</button>
	</form>
	<a href="pwd_updateform.do"><button class="btn btn-info">비밀번호 수정하기</button></a>
</div>
</body>
</html>