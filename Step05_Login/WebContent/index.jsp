<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session에서 "id"라는 키값으로 저장된 문자열이 있느지 읽어와본다
	//있으면 로그인된 상태, null이면 로그인이 안된상태	
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>this is index.jjjsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
	<%if(id==null){ %>
		<ul>
			<li><a href="users/signup_form.jsp">회원가입</a></li>
			<li><a href="users/login_form.jsp">로그인</a></li>
		</ul>		
	<%}else{ %>
		<p>
			<strong>
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %></a>
				님 로그인 됨
			</strong><br/>
			<a href="users/logout.jsp">로그아웃</a>
		</p>
	<%} %>
<h1>인덱스 페이지</h1>
	<ul>
		<li><a href="shop/buy.jsp?num=1&name=coffee">1번상품 구매</a></li>
		<li><a href="shop/buy.jsp?num=2&name=sugar">2번상품 구매</a></li>
		<li><a href="shop/buy.jsp?num=3&name=">3번상품 구매</a></li>
		<li><a href="shop/buy.jsp?num=4&name=">4번상품 구매</a></li>
		<li><a href="shop/buy.jsp?num=5&name=">5번상품 구매</a></li>
	</ul>
</div>
</body>
</html>