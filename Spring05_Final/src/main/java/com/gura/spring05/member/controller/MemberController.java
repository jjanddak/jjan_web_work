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

@Controller
public class MemberController {
	//의존객체 주입받기(DI)
	@Autowired
	private MemberDao dao;	//MemberDao는 MemberDaoImpl 이기도 하므로(구현했으므로) 둘다 사용가능.
							//하지만 의존객체를 직접 임포트하지 않기위해 인터페이스타입으로 선언.
	
	//회원목록 보기 요청(/member/list.do)를 처리할 컨트롤러의 메소드.
	@RequestMapping("/member/list")
	public ModelAndView list(ModelAndView mView) {
		//회원목록을 얻어오려면?
		List<MemberDto> list=dao.getList();
		
		mView.addObject("list",list);
		mView.setViewName("member/list");
		
		return mView;
	}
	
	
	//회원정보 삭제 처리
	@RequestMapping("/member/delete")
	public String delete(@RequestParam int num) {
		//MemberDao 객체를 이용해서 회원정보 삭제
		dao.delete(num);
		
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
		
		dao.insert(dto);
		/*
		 * @ModelAttrivute("dto") MemberDto dto 의 의미
		 * 
		 * 1. 전송되는 파라미터를 추출해서 MemberDto에 담고
		 * 2. "dto"라는 키값으로 MemberDto 객체를 request 영역에 담는다.
		 * 
		 */
		//mView.addObject("dto", dto); 
		mView.setViewName("member/insert");
		
		return mView;
	}
	
	
	
	
}







