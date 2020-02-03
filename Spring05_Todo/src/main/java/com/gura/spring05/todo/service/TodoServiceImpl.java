package com.gura.spring05.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.todo.dao.TodoDao;
import com.gura.spring05.todo.dto.TodoDto;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	private TodoDao dao;
	
	@Override
	public void getList(ModelAndView mView) {
		List<TodoDto> list=dao.getList();
		
		mView.addObject("list",list);

	}

	@Override
	public void addTodo(TodoDto dto) {
		dao.insert(dto);
	}

	@Override
	public void getTodo(ModelAndView mView, int num) {
		TodoDto dto=dao.getData(num);
		mView.addObject("dto",dto);
	}

	@Override
	public void updateTodo(TodoDto dto) {
		dao.update(dto);
	}

	@Override
	public void deleteTodo(int num) {
		dao.delete(num);
	}

	@Override
	public List<TodoDto> getqList(ModelAndView mView, String query) {
		List<TodoDto> list=dao.getqList(query);
		mView.addObject("list",list);
		mView.addObject("query", query);
		return list;
	}
	
}
