<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션아이디 읽기
	String id=(String)session.getAttribute("id");

	//1. DB에서 파일목록얻기
	List<FileDto> list=new ArrayList<>();
	list=FileDao.getInstance().getList();
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
	<table class="table table-striped table-condensedl">
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
					<td>
						<a href="${pageContext.request.contextPath }
						/file/download.jsp?num=<%=tmp.getNum()%>">
							<%=tmp.getOrgFileName() %>
						</a>
					</td>
					<td><%=tmp.getFileSize()%></td>
					<td><%=tmp.getDownCount()%></td>
					<td><%=tmp.getRegdate()%></td>
					<td>
						<%if(tmp.getWriter().equals(id)){ %>
							<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">
								삭제
							</a>
						<%} %>
					</td>
				</tr>
			<%} %>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">파일 업로드</a>
</div>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 파일을 삭제하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}else{
			
		}
	}
</script>
</body>
</html>