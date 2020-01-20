<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//checkbox를 체크했는지 (체크안하면 null)
	String isPopup=request.getParameter("isPopup");
	if(isPopup!=null){
		//팝업띄울 여부를 쿠키로 저장
		Cookie popCook=new Cookie("isPopup",isPopup);
		//60초만 유지되도록.
		popCook.setMaxAge(60);
		//응답객체(HttpServletResponse)를 이용해 쿠키도응답
		response.addCookie(popCook);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	self.close();
</script>
</body>
</html>