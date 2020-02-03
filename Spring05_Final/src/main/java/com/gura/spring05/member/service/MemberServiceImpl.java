package com.gura.spring05.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.member.dao.MemberDao;
import com.gura.spring05.member.dto.MemberDto;

public class MemberServiceImpl implements MemberService{
	//의존객체 주입받기 (DI)
	@Autowired
	private MemberDao dao;
	
	//회원목록을 인자로 전달받은 ModelAndView 객체에 담는 로직을 처리하는 서비스 메소드.
	@Override
	public void getList(ModelAndView mView) {
		List<MemberDto> list=dao.getList();
		
		mView.addObject("list",list);

	}
	
	//인자로 전달되는 새로운 회원정보를 DB에 저장하는 비즈니스로직 처리
	@Override
	public void addMember(MemberDto dto) {
		dao.insert(dto);
	}
	
	
}
