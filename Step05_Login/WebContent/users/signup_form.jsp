<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/*페이지 로딩시점에 도움말과 피드백 아이콘 은 일단 숨기기*/
	.help-block, .form-control-feedback{
		display:none;
	}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
	<h1>회원가입</h1>
	<form action="signup.jsp" method="post" id="signupForm">
		<div class="form-group has-feedback">
			<label class="control-label" for="id">아이디</label>
			<input class="form-control" type="text" id="id" name="id"/>
			<p class="help-block" id="msg_input">아이디를 입력해주세요!!!</p>
			<p class="help-block" id="msg_notuse">사용 불가능한 아이디 입니다.</p>
			<p class="help-block" id="msg_canuse">사용 가능한 아이디 입니다.</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div>
			<label class="control-label" for="pwd2">패스워드 확인</label>
			<input class="form-control" type="password" id="pwd2" name="pwd2"/>
			<p class="help-block" id="msg_pwdinput">비밀번호가 일치하지 않습니다..</p>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="email" id="email" name="email"/>
			<p class="help-block" id="msg_eminput">이메일을 입력해주세요!!!</p>
			<p class="help-block" id="msg_emnotuse">사용 불가능한 이메일 입니다.</p>
			<p class="help-block" id="msg_emcanuse">사용 가능한 이메일 입니다.</p>
			<p class="help-block" id="msg_emformat">이메일 형식에 맞지 않습니다!</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<button id="submitBtn" type="submit">가입</button>
	</form>
</div>
<script>
	//아이디 유효성 여부
	var isIdValid=false;
		
	//가입버튼 비활성화
	$("#submitBtn")
	.prop("disabled",true);
	
	function idOk(){//아이디창 오케이상태로
		$("#id").parent()
		.addClass("has-success")
		.find(".glyphicon-ok")
		.show();
	}
	
	function idError(){//아이디창 에러상태로
		$("#id").parent()
		.addClass("has-error")
		.find(".glyphicon-remove")
		.show();
	}
	
	
	$("#id").on("focus",function(){
		var inputId=$("#id").val();
		if(inputId==""){
			idError();
			$("#msg_input").show();		
			$("#msg_notuse").hide();
			$("#msg_canuse").hide();
		}
	});
	
	$("#id").focus();

	var idValid=null;
	//아이디를 입력할때마다 중복검사
	$("#id").on("input",function(){
		//1. 아이디 읽어오기
		inputId=$("#id").val();
		//2. 서버에 보내서 사용가능 여부 응답받기
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkid.jsp",
			method:"GET",
			data:{inputId:inputId}, // == checkid.jsp?inputId="input value"
			success:function(responseData){
				//일단 초기화시키기
				$("#id").parent()
				.removeClass("has-success has-error")
				.find(".form-control-feedback")
				.hide();
				
				idValid=inputId.match(/\s/);
				if(responseData.isExist||idValid!=null){//아이디가 존재하면(사용불가)
					$("#id").parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					//에서메세지 보이게
					$("#msg_input").hide();
					$("#msg_notuse").show();
					$("#msg_canuse").hide();
					isIdValid=false;
				}else if(inputId!=""){//(사용가능)
					$("#id").parent()
					.addClass("has-success")
					.find(".glyphicon-ok")
					.show();
					$("#msg_input").hide();
					$("#msg_notuse").hide();
					$("#msg_canuse").show();
					isIdValid=true;
				}else if(inputId==""){
					$("#id").parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					$("#msg_input").show();		
					$("#msg_notuse").hide();
					$("#msg_canuse").hide();
				}
			}
		});
	});	
	
	//비밀번호 검증
	$("#pwd").on("input",function(){
		//초기화
		$("#pwd").parent()
		.removeClass("has-success has-error")
		.find(".form-control-feedback")
		.hide();
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		if(pwd==pwd2){
			$("#pwd").parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
			$("#msg_pwdinput").hide();
		}else{
			$("#msg_pwdinput").show();
			$("#pwd").parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
		}
	});
	
	var pwd=null;
	var pwd2=null;
	$("#pwd2").on("input",function(){
		//초기화
		$("#pwd").parent()
		.removeClass("has-success has-error")
		.find(".form-control-feedback")
		.hide();
		pwd=$("#pwd").val();
		pwd2=$("#pwd2").val();
		if(pwd==pwd2){
			$("#pwd").parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
			$("#msg_pwdinput").hide();
		}else{
			$("#msg_pwdinput").show();
			$("#pwd").parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
		}
	});
	
	//이메일창 포커스시 입력하라는 메세지출력
	$("#email").on("focus",function(){
		var inputEmail=$("#email").val();
		if(inputEmail==""){
			$("#email").parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
			$("#msg_eminput").show();		
			$("#msg_emnotuse").hide();
			$("#msg_emcanuse").hide();
		}
	});
	
	var emailValid=null;
	var emailValid2=null;
	//이메일 검증
	$("#email").on("input",function(){
		//1. 이메일 읽어오기
		inputEmail=$("#email").val();
		
		//2. 서버에 보내서 사용가능 여부 응답받기
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkemail.jsp",
			method:"GET",
			data:{inputEmail:inputEmail}, // == checkid.jsp?inputId="input value"
			success:function(responseData){
				//일단 초기화시키기
				$("#email").parent()
				.removeClass("has-success has-error")
				.find(".form-control-feedback")
				.hide();
				
				if(responseData.isExist2){//이메일이 존재하면(사용불가)
					$("#email").parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					//에서메세지 보이게
					$("#msg_eminput").hide();
					$("#msg_emnotuse").show();
					$("#msg_emcanuse").hide();
					isIdValid=false;
				}else if(inputEmail!=""){//(사용가능)
					$("#email").parent()
					.addClass("has-success")
					.find(".glyphicon-ok")
					.show();
					$("#msg_eminput").hide();
					$("#msg_emnotuse").hide();
					$("#msg_emcanuse").show();
					isIdValid=true;
				}else if(inputEmail==""){
					$("#email").parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					$("#msg_eminput").show();		
					$("#msg_emnotuse").hide();
					$("#msg_emcanuse").hide();
				}
				emailValid=inputEmail.match('@');
				emailValid2=inputEmail.match(/\s/);	//공백정규식을 이용한 공백검사
				if(emailValid==null||emailValid2!=null){//@없거나 공백있을때
					$("#email").parent()
					.addClass("has-error")
					.find(".glyphicon-remove")
					.show();
					$("#msg_eminput").hide();
					$("#msg_emformat").show();
					$("#msg_emnotuse").hide();
					$("#msg_emcanuse").hide();
				}else{//@있고 공백없을때
					$("#email").parent()
					.addClass("has-success")
					.find(".glyphicon-ok")
					.show();
					$("#msg_emformat").hide();
				}
			}
		});
	});	
	
	
	
	//폼에 제ㅍ출이벤트가 발생했을 때 실행
	$("#signupForm").on("submit",function(){
		//폼의 유효성검사를 하고 제출을 막는다
		
		//1. 아이디 유효성 검증
		if(!isIdValid){
			alert("아이디 중복확인 하세요!");
			$("#id").focus();
			return false;//폼 제출 막기
		}
		
		//2. 비밀번호 유효성 검증
		//var pwd=$("#pwd").val();
		//var pwd2=$("#pwd2").val();
		if(pwd!=pwd2){
			alert("비밀번호가 같지 않아요!")
			$("#pwd").focus();
			return false;
		}
		
		//3. 이메일 유효성 검증
		var email=$("#email").val();
		// @ 가 포함되어있는지 확인, 포함되어있지 않으면 return null;
		var emailValid=email.match("@");
		if(emailValid==null){
			alert("이메일 형식에 맞게 입력하세요!")
			$("#email").focus();
			return false;
		}
	});
	
	//가입버튼 비활성화
	$("#submitBtn")
	.prop("disabled",false);
	
	
</script>
</body>
</html>