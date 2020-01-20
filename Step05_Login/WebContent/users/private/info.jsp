<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 세션에서 로그인된 아이디 정보를 읽어옴
	String id=(String)session.getAttribute("id");
	//2. DB에서 해당 아이디의 정보를 얻기.
	UsersDto dto=UsersDao.getInstance().getData(id);
	//3. 개인정보를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOUR INFO</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	/* 프로필 이미지를 가로세로 50px 인 원형으로 표시 */
	#profileLink img{
		width:50px;
		height: 50px;
		border-radius:50%;
	}
	
	#profileForm{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>개인정보 페이지</h1>
	<table class="table table-striped table-condensed">
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<a href="javascript:" id="profileLink">
					<%if(dto.getProfile()==null){ %>
						<img src="${pageContext.request.contextPath }/resources/images/111.jpeg" alt="" />
					<%}else { %>
						<img src="${pageContext.request.contextPath }<%=dto.getProfile() %>" alt="" />
					<%} %>
				</a>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a href="updateform.jsp"><button class="btn btn-primary">개인정보 수정하기</button></a>
	<a href="javascript:deleteConfirm()"><button class="btn btn-danger">회원탈퇴</button></a>
</div>
<form action="profile_upload.jsp" method="post"
	enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage" 
		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
</form>

<script>
	function deleteConfirm(){
		var isDelete=confirm("<%=id%>님 탈퇴하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
	
	$("#profileLink").click(function(){
		$("#profileImage").click();
	});
</script>
</body>
</html>