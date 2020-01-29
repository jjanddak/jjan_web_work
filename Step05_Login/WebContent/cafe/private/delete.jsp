<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//1. 삭제할 글번호
	int num=Integer.parseInt(request.getParameter("num"));
	request.setAttribute("num", num);

	//작성자와 로그인자가 같은지검사
	String id=(String)session.getAttribute("id");
	String writer=CafeDao.getInstance().getData(num).getWriter();
	boolean Valid=id.equals(writer);
	request.setAttribute("Valid", Valid);
	
	if(!Valid){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,
				"남의 글 삭제하기 불가");
		return;
	}
	
	//2. DB에서 삭제
	boolean isDelete=CafeDao.getInstance().delete(num);
	request.setAttribute("isDelete", isDelete);
	//3. d응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<c:choose>
	<c:when test="${isDelete && Valid eq true }">
		<script>
			alert("${num}번 글이 삭제되었습니다.")
			location.href="${pageContext.request.contextPath }/cafe/list.jsp"
		</script>
	</c:when>
	<c:otherwise>
		<h1>ALERT</h1>
		<p class="alert alert-danger">글삭제 실패!
			<a href="../detail.jsp?num=${num }">돌아가기</a>
		</p>
	</c:otherwise>
</c:choose>
</body>
</html>