package com.gura.test;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	// /home.do 요청이 왔을 때 요청을 처리하게 하는 @RequestMapping 어노테이션
	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		//모델
		List<String> todo=new ArrayList<String>();
		todo.add("기상");
		todo.add("식사");
		todo.add("세면");
		todo.add("착용");
		todo.add("등원");
		todo.add("공부");
		todo.add("하원");
		
		//모델을 request에 담기.
		request.setAttribute("todo",todo);
		
		
		/*
		 * "home"을 리턴해주면
		 * 
		 * "/WEB-INF/views/"+"home+".jsp" 와 같은 문자열이 만들어 지고
		 * 
		 *  /WEB-INF/views/home.jsp 페이지로 forward 이동 후
		 *  
		 *  응답된다.
		 * 
		 */
		return "home";
	}
}
