package com.example.web01.family.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.web01.family.dao.FamilyDao;
import com.example.web01.family.dto.FamilyDto;

@Controller
public class FamilyController {

	@Autowired
	private FamilyDao dao;
	
	@RequestMapping("/family/list")
	public ModelAndView list(ModelAndView mView) {
		//MemberServiceImpl 객체를 이용해서 비즈니스 로직 처리
		List<FamilyDto> list=dao.getList();
		
		mView.addObject("list",list);
		//view page 정보를 담고
		mView.setViewName("family/list");
		
		return mView;
	}
	
	@RequestMapping("/family/delete")
	public String delete(@RequestParam int num) {
		
		
		dao.delete(num);
		
		//리다이렉트 응답.
		return "redirect:/family/list.do";
	}
	
	
	@RequestMapping("/family/insertform")
	public String insertform() {

		//비즈니스로직은 없다				
		return "family/insertform";
	}
	
	@RequestMapping("/family/insert")
	public ModelAndView insert(@ModelAttribute("dto") FamilyDto dto,
			ModelAndView mView) {
		 
		dao.insert(dto);
				
		mView.setViewName("family/insert");
		
		return mView;
	}
	
	@RequestMapping("/family/updateform")
	public ModelAndView updateform(@RequestParam int num,
			ModelAndView mView) {
		
		FamilyDto dto=dao.getData(num);
		
		mView.addObject("dto",dto);
		mView.setViewName("family/updateform");
		
		return mView;
	}
	
	@RequestMapping("/family/update")
	public ModelAndView update(@ModelAttribute("dto") FamilyDto dto,
			ModelAndView mView) {
		
		dao.update(dto);
	
		mView.setViewName("family/update");
		
		return mView;
	}
	
	
}
