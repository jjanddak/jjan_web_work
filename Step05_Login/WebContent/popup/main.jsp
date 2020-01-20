<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키읽어오기
	Cookie[] cookies=request.getCookies();
	
	//팝업띄울지 여부
	String isPopup="";//빈문자열을 초기값으로.
	boolean canPopup=true;
	if(cookies!=null){		
		//반복문돌며 모든쿠키 참조
		for(Cookie tmp:cookies){
			//isPopup이라는 쿠키이름으로 저장된 값이있으면
			if(tmp.getName().equals("isPopup")){
				isPopup=tmp.getValue();
				//팝업띄우지않도록 한다.
				canPopup=false;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popup main popup.jsp</title>
</head>
<body>
<h3>메인페이지</h3>
<p>자동으로 팝업이 뜸</p>
<p>홈쇼핑</p>
<p>미리봄을 준비해요</p>
<%if(isPopup.equals("")&&canPopup){ %>
<script>
	window.open("sale.jsp","sale","width=400,height=300,top=300,left=500,resizable=no");
</script>
<%} %>
</body>
</html>