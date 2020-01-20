<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키읽어오기
	Cookie[] cookies=request.getCookies();

	//저장된 아이디 담기
	String savedId="";//빈문자열을 초기값으로.
	if(cookies!=null){
		for(Cookie tmp:cookies){
			if(tmp.getName().equals("savedId")){
				savedId=tmp.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookietest2</title>
</head>
<body>
<form action="login.jsp" method="post">
	<div>
		<label for="id">아이디</label>
		<input type="text" name="id" id="id" value="<%=savedId %>"/>
	</div>
	<div>
		<label>
			아이디 저장<input type="checkbox" name="isSave" value="yes" />
		</label>
	</div>
	<button type="submit">로그인</button>
</form>
</body>
</html>