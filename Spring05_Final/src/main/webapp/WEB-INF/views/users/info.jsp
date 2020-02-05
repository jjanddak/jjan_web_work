<%@page import="com.gura.spring05.users.dto.UsersDto"%>
<%@page import="com.gura.spring05.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOUR INFO</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
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
			<td>${id}</td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<a href="javascript:" id="profileLink">
					<c:choose>
						<c:when test="${empty dto.profile}">
							<img src="${pageContext.request.contextPath }/resources/images/bottle.png"/>
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }${dto.profile}" alt="" />
						</c:otherwise>
					</c:choose>
				</a>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email}</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.regdate}</td>
		</tr>
		<tr>
			<th>비밀번호 수정</th>
			<td><a href="pwd_updateform.do">비밀번호 수정하기</a></td>
		</tr>
	</table>
	<a href="updateform.do"><button class="btn btn-primary">개인정보 수정하기</button></a>
	<a href="javascript:deleteConfirm()"><button class="btn btn-danger">회원탈퇴</button></a>
</div>
<form action="profile_upload.do" method="post"
	enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage" 
		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
</form>
<%-- jquery form 플러그인 javascript 로딩 --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>	
	//프로필 이미지 클릭하면
	$("#profileLink").click(function(){
		//강제로 <input type="file" />을 클릭한것 처럼 동작.
		$("#profileImage").click();
	});
	//프로필 이미지가 선택되면
	$("#profileImage").on("change",function(){
		//폼을 강제 제출한다.
		$("#profileForm").submit(); //제출버튼 눌렀을때의 효과((input type="submit")이벤트발생시킴)
	});
	//jquery form 플러그인의 동작을이용해서 폼이 ajax로 제출되도록 한다.
	$("#profileForm").ajaxForm(function(responseData){//폼이 제출되었을 때  메소드실행하고, 페이지 전환을 막음
		//responseData는 plain object이다
		//{savedPath:"/upload/저장된 이미지파일명"}
		//savedPath라는 방에 저장된 이미지경로가 들어있다.
		console.log(responseData); //json형식의 데이터 응답받는다.
		var src="${pageContext.request.contextPath }"+responseData.savedPath;
		//img 의 src속성에 반영함으로써 이미지가 업데이트되도록한다.
		$("#profileLink img").attr("src",src) //img의 src속성은 바뀌면 이미지 리로드한다.
	});
	
	function deleteConfirm(){
		var isDelete=confirm("${id} 님 탈퇴하시겠습니까?");
		if(isDelete){
			location.href="delete.do";
		}
	}
</script>
</body>
</html>