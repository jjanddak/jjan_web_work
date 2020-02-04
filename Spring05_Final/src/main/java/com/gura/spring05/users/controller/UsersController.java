package com.gura.spring05.users.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.users.dto.UsersDto;
import com.gura.spring05.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	
	@RequestMapping("/users/signup_form")
	public String signup_form() {
		
		return "users/signup_form";
	}
	
	/*
	 * [ JSON 문자열 응답하는 방법 ]
	 * 
	 * 1. pom.xml 에 jackson-databind dependency 명시
	 * 2. controller 의 메소드에 @ResponseBody 어노테이션 붙이기
	 * 3. List, Map, Dto 중 하나를 리턴.
	 * 
	 */
	@ResponseBody
	@RequestMapping("/users/checkid")
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.isExistId(inputId);
		return map;
	}		
	
	@RequestMapping(value = "users/signup",method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("dto") UsersDto dto,
			ModelAndView mView) {
		service.addUser(dto);
		mView.setViewName("users/insert");
		
		return mView;
	}
	
	//로그인폼 요청 처리
	@RequestMapping("/users/loginform")
	public String loginform(HttpServletRequest request) {
		
		// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.  
		String url=request.getParameter("url");
		if(url==null){//만일 없으면 
			//로그인 성공후에 index.jsp 페이지로 보낼수 있도록 구성한다. 
			url=request.getContextPath()+"/home.do";
		}
		
		//쿠키읽어오기
		Cookie[] cookies=request.getCookies();

		//저장된 아이디 담기
		String savedId="";//빈문자열을 초기값으로.
		String savedPwd="";//빈문자열을 초기값으로.
		
		if(cookies!=null){
			for(Cookie tmp:cookies){
				if(tmp.getName().equals("savedId")){
					savedId=tmp.getValue();
				}else if(tmp.getName().equals("savedPwd")){
					savedPwd=tmp.getValue();
				}
			}
		}
		//view page에서 필요한 정보 넘겨주기
		request.setAttribute("url", url);
		request.setAttribute("savedId", savedId);
		request.setAttribute("savedPwd", savedPwd);
				
		return "users/loginform";
	}
	
	
	
	
	
	
}








