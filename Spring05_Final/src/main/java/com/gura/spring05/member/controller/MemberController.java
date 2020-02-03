package com.gura.spring05.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.member.dao.MemberDao;
import com.gura.spring05.member.dto.MemberDto;
import com.gura.spring05.member.service.MemberService;

@Controller
public class MemberController {
	//의존객체 주입받기(DI)
	@Autowired
	private MemberDao dao;	//MemberDao는 MemberDaoImpl 이기도 하므로(구현했으므로) 둘다 사용가능.
							//하지만 의존객체를 직접 임포트하지 않기위해 인터페이스타입으로 선언.
	//의존객체 주입받기 (DI)
	@Autowired
	private MemberService service;
	
	
	@RequestMapping("/member/list")
	public ModelAndView list(ModelAndView mView) {
		//MemberServiceImpl 객체를 이용해서 비즈니스 로직 처리
		service.getList(mView);
		
		//view page 정보를 담고
		mView.setViewName("member/list");
		
		return mView;
	}
	
	
	//회원정보 삭제 처리
	@RequestMapping("/member/delete")
	public String delete(@RequestParam int num) {
		
		//서비스 이용해서 회원정보 삭제
		service.deleteMember(num);
		
		//리다이렉트 응답.
		return "redirect:/member/list.do";
	}
	
	
	@RequestMapping("/member/insertform")
	public String insertform() {

		//비즈니스로직은 없다				
		return "member/insertform";
	}
	
	/*
	 * @ModelAttribute MemberDto dto 를 메소드의 인자로 선언하면
	 * 폼 전송되는 파라미터가 자동으로 MemberDto 객체에 setter 메소드를 통해서
	 * 들어가고 그 객체가 메소드의 인자로 전달된다.
	 * 
	 * 단, 파라미터명과 Dto 의 필드명이 일치해야 한다. 
	 * 
	 */
	
	@RequestMapping("/member/insert")
	public ModelAndView insert(@ModelAttribute("dto") MemberDto dto,
			ModelAndView mView) {
		
		//서비스를 통해서 비즈니스 로직 처리 
		service.addMember(dto);
				
				
		/*
		 * @ModelAttrivute("dto") MemberDto dto 의 의미
		 * 
		 * 1. 전송되는 파라미터를 추출해서 MemberDto에 담고
		 * 2. "dto"라는 키값으로 MemberDto 객체를 request 영역에 담는다.
		 * 
		 */
		mView.setViewName("member/insert");
		
		return mView;
	}
	
	@RequestMapping("/member/updateform")
	public ModelAndView updateform(@RequestParam int num,
			ModelAndView mView) {
		
		service.getMember(mView, num);
		
		mView.setViewName("member/updateform");
		
		return mView;
	}
	
	@RequestMapping("/member/update")
	public ModelAndView update(@ModelAttribute("dto") MemberDto dto,
			ModelAndView mView) {
		service.updateMember(dto);
	
		mView.setViewName("member/update");
		
		return mView;
	}
	

	
}







