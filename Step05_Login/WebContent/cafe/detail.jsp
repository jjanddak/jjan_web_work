<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식ㅇ 파라미터로 전달되는 글번호 읽기;
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB에서 글정보가져오기
	CafeDto dto=CafeDao.getInstance().getData(num);
	//3. 해당글의 조회수 1증가
	CafeDao.getInstance().addViewCount(num);
	//4. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글제목 : <%=dto.getTitle() %></title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.contents, table{
		width: 100%;
		border: 1px dotted #cecece;
		box-shadow: 3px 3px 5px 6px #ccc;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="category"></jsp:param>
</jsp:include>
<div class="container">
	<ol class="breadcrumb">
		 <li><a href="${pageContext.request.contextPath }/cafe/list.jsp">목록</a></li>
		<li>글 상세보기</li>
	</ol>
	<h1>글 자세히</h1>
	<table class="table table-bordered table-condensed">
		<colgroup>
			<col class="col-xs-3"/>
			<col class="col-xs-9"/>
		</colgroup>
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewCount() %></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<div class="contents"><%=dto.getContent() %></div>
	<a href="list.jsp">목록으로</a>
	<%
		//세션의 아이디를 가져옴, 만일 로그인하지 않았으면 null 이다.	
		String id=(String)session.getAttribute("id");
	%>
	<%-- 글 작성자와 로그인된 아이디가 같을 때 수정링크 표시. --%>
	<%if(dto.getWriter().equals(id)){ %>
		<a href="private/updateform.jsp?num=<%=dto.getNum()%>">
			수정
		</a>		
	<%} %>
</div>
</body>
</html>