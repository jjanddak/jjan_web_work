<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertformAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	/* textarea의 크기가 smarteditor의 크기가된다*/
	#content{
		display: none;
		width: 100%;
		height: 400px;
	}
</style>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="cafe" name="category"></jsp:param>
</jsp:include>
<%
	//로그인 회원의 아이디 읽기
	String id=(String)session.getAttribute("id");
	request.setAttribute("id", id);
%>
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/cafe/list.jsp">목록</a></li>
			<li>새글 작성</li>
		</ol>
		<h1>새글작성 양식</h1>
		<form action="insert.jsp" method="post">
			<div class="form-group">
				<label for="writer">작성자</label>
				<input class="form-control" type="text" value="${id }" />
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input class="form-control"  type="text" name="title" id="title" />
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
			</div>
			<button class="btn btn-primary" type="submit" onclick="submitContents(this);">작성</button>
			<button class="btn btn-warning" type="reset">취소</button>
		</form>
	</div>
	<%--
		[ SmartEditor 를 사용하기 위한 설정 ] 
		
		1. WebContent 에 SmartEditor 폴더 복사 붙이기
		2. Webcontent 에 upload 폴더 만들기
		3. WebContent/WEB-INF/lib 폴더에
			commons-io.jar 파일과 commons-fileupload.jar 파일 붙이기
		4. <textarea id="content" name="content"> 에서 
		 	content이름이 사용되기 때문에 다른이름으로 바꾸고싶으면 javascript에서 
		 	content를 찾아 모두다른이름으로 바꾼다.
		5. textarea 의 크기가 SmartEditor의 크기가 된다.
		6. 폼을 제출하고 싶으면 submitContents(this) 라는 javascript가
			폼 안에 있는 버튼에서 실행되면 된다.
	 --%>
	
	<!-- SmartEditor 에서 필요한 javascript 로딩  -->
	<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
	<script>
		var oEditors = [];
		
		//추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function(){
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
		
		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
		}
		
		function showHTML() {
			var sHTML = oEditors.getById["content"].getIR();
			alert(sHTML);
		}
			
		function submitContents(elClickedObj) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
			
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
			
			try {
				elClickedObj.form.submit();
			} catch(e) {}
		}
		
		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
</body>
</html>