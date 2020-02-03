package com.gura.spring05;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	// /home.do 요청이 왔을 때 요청을 처리하게 하는 @RequestMapping 어노테이션
	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		//모델
		List<String> notice=new ArrayList<String>();
		notice.add("감기조심");
		notice.add("코로나조심");
		notice.add("에브리바디 서바이브!");
		notice.add("lorem ipsum");
		notice.add("문자열이 필요합니다");
		
		//모델을 request에 담기.
		request.setAttribute("notice", notice);
		
		
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
