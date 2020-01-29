<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ajax요청과 함게 inputId 라는 파라미터명으로 전달된 값 읽기
	String inputEmail=request.getParameter("inputEmail");
	//DB에 이미 존재하는지 화긴
	boolean isExist2=UsersDao.getInstance().isExist2(inputEmail);
	//존재하는지 여부를 json형식의 문자열로 응답.
%>
{"isExist2":<%=isExist2 %>}


