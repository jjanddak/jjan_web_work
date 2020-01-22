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
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
<h1>인덱스 페이지</h1>
	<ul>
		<li><a href="shop/buy.jsp?num=1&name=coffee">1번상품 구매</a></li>
		<li><a href="shop/buy.jsp?num=2&name=sugar">2번상품 구매</a></li>
		<li><a href="cafe/list.jsp">글목록 보기</a></li>
		<li><a href="file/list.jsp">파일 목록보기</a></li>
		<li><a href="cook/test1.jsp">쿠키테스트</a></li>
		<li><a href="cook/test2.jsp">쿠키테스트2</a></li>
		<li><a href="popup/parent.html">팝업 테스트</a></li>
		<li><a href="popup/main.jsp">팝업테스트2</a></li>
		<li><a href="el01">El 테스트</a></li>
		<li><a href="el02">EL 테스트2</a></li>
		<li><a href="el03">EL 테스트3</a></li>
		<li><a href="jstl/test01.jsp">JSTL TEst</a></li>
		<li><a href="jstl/test02.jsp">JSTL TEST2</a></li>
		<li><a href="jstl/test03.jsp">JSTL TEST3</a></li>
		<li><a href="jstl/test04.jsp">JSTL TEST4..</a></li>
		<li><a href="fortune">MVC TEST (오늘의 운세)</a></li>
		<li><a href="cafe/list.nhn">MVC 카페 글목록 보기</a></li>
	</ul>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>