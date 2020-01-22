<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	//세션아이디 읽기
	String id=(String)session.getAttribute("id");

	//1. DB에서 파일목록얻기
//	List<FileDto> list=new ArrayList<>();
//	list=FileDao.getInstance().getList();
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
<%
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=3;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=3;
	
	//보여줄 페이지의 번호
	int pageNum=1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=FileDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다. 
	}	

	//cafedto 객체에 로우넘들 담는다.
	FileDto dto=new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//1. DB에서 글목록을 얻어오기
	List<FileDto> list=FileDao.getInstance().getList(dto);
	request.setAttribute("list", list);
	request.setAttribute("startPageNum", startPageNum);
	request.setAttribute("endPageNum", endPageNum);
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("totalPageCount", totalPageCount);
	//2. 글목록을 응답.
%>
<h1>파일목록</h1>
<div class="container">
	<table class="table table-striped table-condensed">
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
			<c:forEach var="tmp" items="${list}">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td>${tmp.title }</td>
					<td>
						<a href="${pageContext.request.contextPath }
						/file/download.jsp?num=${tmp.num}">
							${tmp.orgFileName }
						</a>
					</td>
					<td><fmt:formatNumber value="${tmp.fileSize }" /> byte</td>
					<td>${tmp.downCount }</td>
					<td>${tmp.regdate }</td>
					<td>
						<c:if test="${tmp.writer eq id }">
							<a href="javascript:deleteConfirm(${tmp.num})">삭제</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">파일 업로드</a>
	<div class="page-display">
		<ul class="pagination pagination-sm">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li>
						<a href="list.jsp?pageNum=${startPageNum-1}">&laquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a href="javascript:">&laquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum}">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="active">
							<a href="list.jsp?pageNum=${i }">${i }</a>
						</li>						
					</c:when>
					<c:otherwise>
						<li>
							<a href="list.jsp?pageNum=${i }">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li>
						<a href="list.jsp?pageNum=${endPageNum+1}">&raquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a href="javascript:">&raquo;</a>
					</li>
				</c:otherwise>
			</c:choose>	
		</ul>
	</div>
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