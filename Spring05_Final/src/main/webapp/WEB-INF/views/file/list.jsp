<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
						/file/download.do?num=${tmp.num}">
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
	<a href="${pageContext.request.contextPath }/file/upload_form.do">파일 업로드</a>
	<div class="page-display">
		<ul class="pagination pagination-sm">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li>
						<a href="list.do?pageNum=${startPageNum-1}">&laquo;</a>
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
							<a href="list.do?pageNum=${i }">${i }</a>
						</li>						
					</c:when>
					<c:otherwise>
						<li>
							<a href="list.do?pageNum=${i }">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li>
						<a href="list.do?pageNum=${endPageNum+1}">&raquo;</a>
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
			location.href="delete.do?num="+num;
		}else{
			
		}
	}
</script>
</body>
</html>