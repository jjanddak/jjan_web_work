package com.gura.spring03.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {
	@RequestMapping("/users/loginform")
	public String loginform() {
		//수행할 비즈니스 로직 = 없다
		//request 영역에 담을 모델도 없다!
		
		//view page 의 정보만 단순히 리턴해주는 경우.
		return "users/loginform";
	}
	
	
	@RequestMapping("/users/login")
	public String login(HttpServletRequest request, HttpSession session) {
		//폼 전송되는 파라미터 추출
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		//유효한 정보인지 여부
		boolean isValid=false;
		if(id.equals("gura") && pwd.equals("123")) {
			isValid=true;
			session.setAttribute("id", id);
		}
		//로그인 성공여부를 request에 담는다
		request.setAttribute("isValid", isValid);
		
		//view page의 정보를 리턴.
		return "users/login";
	}
}





