<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request 객체에 담겨서 전달된 쿠키목록 읽기
	Cookie[] cookies=request.getCookies();

	String savedMsg=null;
	
	//만일 Cookie[] 이 null 이 아니면
	if(cookies!=null){
		//반복문 돌며 Cookie 객체를 하나씩 참조해서
		for(Cookie tmp:cookies){
			//쿠키 키값이 savedMsg라면
			if(tmp.getName().equals("savedMsg")){
				//쿠키로 저장된값 읽어오기
				savedMsg=tmp.getValue();
			}
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cook/read1.jsp</title>
</head>
<body>
	<p>쿠키로 저장되었던 문자열 : <strong><%=savedMsg %></strong></p>
</body>
</html>