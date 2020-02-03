package com.gura.spring05.todo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.todo.dao.TodoDao;
import com.gura.spring05.todo.dto.TodoDto;
import com.gura.spring05.todo.service.TodoService;

@Controller
public class TodoController {
	
	@Autowired
	private TodoDao dao;
	
	@Autowired
	private TodoService service;
	
	@RequestMapping("/todo/list")
	public ModelAndView list(ModelAndView mView) {
		service.getList(mView);
		
		mView.setViewName("todo/list");
		
		return mView;
	}
	

	//회원정보 삭제 처리
	@RequestMapping("/todo/delete")
	public String delete(@RequestParam int num) {
		service.deleteTodo(num);
		
		//리다이렉트 응답.
		return "redirect:/todo/list.do";
	}
	
	
	@RequestMapping("/todo/insertform")
	public String insertform() {

		//비즈니스로직은 없다				
		return "todo/insertform";
	}
	
	/*
	 * @ModelAttribute todoDto dto 를 메소드의 인자로 선언하면
	 * 폼 전송되는 파라미터가 자동으로 todoDto 객체에 setter 메소드를 통해서
	 * 들어가고 그 객체가 메소드의 인자로 전달된다.
	 * 
	 * 단, 파라미터명과 Dto 의 필드명이 일치해야 한다. 
	 * 
	 */
	
	@RequestMapping("/todo/insert")
	public ModelAndView insert(@ModelAttribute("dto") TodoDto dto,
			ModelAndView mView) {
		service.addTodo(dto);
		/*
		 * @ModelAttrivute("dto") todoDto dto 의 의미
		 * 
		 * 1. 전송되는 파라미터를 추출해서 todoDto에 담고
		 * 2. "dto"라는 키값으로 todoDto 객체를 request 영역에 담는다.
		 * 
		 */
		mView.setViewName("todo/insert");
		
		return mView;
	}
	
	@RequestMapping("/todo/updateform")
	public ModelAndView updateform(@RequestParam int num,
			ModelAndView mView) {
		service.getTodo(mView, num);
		
		// view page 로 forward 이동해서 수정할 회원의 정보를 출력.
		mView.setViewName("todo/updateform");
		
		return mView;
	}
	
	@RequestMapping("/todo/update")
	public ModelAndView update(@ModelAttribute("dto") TodoDto dto,
			ModelAndView mView) {
		
		service.updateTodo(dto);
		mView.setViewName("todo/update");
		
		return mView;
	}
	
	@RequestMapping("/todo/search")
	public ModelAndView getqList(ModelAndView mView, @RequestParam String query){
//		List<TodoDto> list=dao.getqList(query);
//		
//		// "list" 라는 키값으로 request 영역에 담기.
//		mView.addObject("list",list);
		
		service.getqList(mView, query);
		
		// view page 로 forward 이동해서 수정할 회원의 정보를 출력.
		mView.setViewName("todo/search");
		
		return mView;
	}
	
}
