package com.gura.spring03;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	// /home.do 요청이 왔을 때 요청을 처리하게 하는 @RequestMapping 어노테이션
	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		//모델
		List<String> notice=new ArrayList<>();
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
	
	@RequestMapping
	public ModelAndView play(HttpSession session, 
			ModelAndView mView) {
		//세션에 로그인정보가 있는지 확인한다.
		String id=(String)session.getAttribute("id");
		if(id==null) { //로그인 안된상태
			mView.setViewName("redirect:/users/loginform.do"); //리다이렉트			
		}else { //로그인된상태
			mView.setViewName("play"); //포워드
		}
		
		return mView;
	}
	
}
