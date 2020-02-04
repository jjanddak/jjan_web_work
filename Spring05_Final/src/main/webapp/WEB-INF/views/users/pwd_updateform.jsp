<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정페이지입니다.................</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
	<h1>비밀번호 수정페이지</h1>
	<form action="pwd_update.do" method="post">
		<div>
			<label for="pwd">기존 비밀번호</label>
			<input type="password" name="pwd" id="pwd"/>
		</div>
		<div>
			<label for="newPwd">새 비밀번호</label>
			<input type="password" name="newPwd" id="newPwd" />
		</div>
		<div>
			<label for="newPwd2">새 비밀번호 확인</label>
			<input type="password" name="newPwd2" id="newPwd2" />
		</div>
		<button type="submit">수정확인</button>
	</form>
</div>
<script>
	//폼에 submit이베느가 일어낫을떄 실행할 함수
	$("form").on("submit", function(){
		var pwd=$("#newPwd").val();
		var pwd2=$("#newPwd2").val();
		if(pwd!=pwd2){
			alert("비밀번호를 똑같이 입력해주세요");
			$("#newPwd").focus();
			return false;
		}
	});
</script>
</body>
</html>