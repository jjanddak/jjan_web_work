<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. DB에서 파일목록얻기
	List<FileDto> list=new ArrayList<>();
	list=FileDao.getInstant().getList();
	//2. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category"></jsp:param>
</jsp:include>
<h1>파일목록</h1>
<div class="container">
	<table>
		<thead>
			<tr>			
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>다운횟수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%for(FileDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td><%=tmp.getOrgFileName() %></td>
					<td><%=tmp.getFileSize()%></td>
					<td><%=tmp.getDownCount()%></td>
					<td><%=tmp.getRegdate()%></td>
				</tr>
			<%} %>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">파일 업로드</a>
</div>
</body>
</html>