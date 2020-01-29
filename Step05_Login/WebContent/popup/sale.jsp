<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키읽어오기
	Cookie[] cookies=request.getCookies();

	//쿠키담을 변수
	String isPopup="";//빈문자열을 초기값으로.
	if(cookies!=null){
		for(Cookie tmp:cookies){
			if(tmp.getName().equals("isPopup")){
				isPopup=tmp.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sale.jsp</title>
<style>
	body{
	background-color:gray;
}
</style>
</head>
<body>
<h3>봄맞이 파격 SALE</h3>
<p> 아디다스 슬리퍼 <del>30,000원</del> 10,000원</p>
<p> 나이키 슈즈 <del>50,000</del> 25,000원</p>
<form action="nopopup.jsp" method="post">
	<label>
		<input type="checkbox" name="isPopup" value="no"/>
		1분 동안 팝업 안뜨게하기
	</label>
	<button type="submit">닫기</button>
</form>
<%if(isPopup.equals("no")){%>
<script>
	self.close();
</script>
<%} %>
</body>
</html>