package com.gura.spring03.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring03.users.dto.UsersDto;

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
	
	/*
	 * @RequestParam 어노테이션은 전송되는 파라미터를 자동으로 추출할 때 사용.
	 * 단, 지역 변수의 이름은 파라미터의 이름과 같아야 한다.
	 * 
	 */
	@RequestMapping("/users/login2")
	public ModelAndView login2(@RequestParam String id, @RequestParam String pwd
					, HttpSession session, ModelAndView mView) {
		
		//유효한 정보인지 여부
		boolean isValid=false;
		if(id.equals("gura") && pwd.equals("123")) {
			isValid=true;
			session.setAttribute("id", id);
		}
		//view 페이지에서 필요한 모델을 담고
		mView.addObject("isValid", isValid);
		
		//view page정보도 담고
		mView.setViewName("users/login");
		
		//리턴한다.
		return mView;
	}
	
	@RequestMapping("/users/login3")
	public ModelAndView login3(@ModelAttribute UsersDto dto, 
			HttpSession session, ModelAndView mView) {
		//유효한 정보인지 여부
		boolean isValid=false;
		if(dto.getId().equals("gura") && dto.getPwd().equals("123")) {
			isValid=true;
			session.setAttribute("id", dto.getId());
		}
		//view 페이지에서 필요한 모델을 담고
		mView.addObject("isValid", isValid);
		
		//view page정보도 담고
		mView.setViewName("users/login");
		
		//리턴한다.
		return mView;
	}
	
	//로그아웃처리하는 메소드
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
			
		/*
		 *	리다이렉트 이동응답을 하려면
		 * 	view page 의 정보를
		 * 	"redirect: 리다이렉트 시킬 절대경로" 
		 * 	형식으로 작성한다.
		 * 
		 * 	단, context path는 작성하지 않는다.(자동으로 붙기 떄문. 이경우엔 spring03)
		 */
		return "redirect:/home.do";
	}
	
}





