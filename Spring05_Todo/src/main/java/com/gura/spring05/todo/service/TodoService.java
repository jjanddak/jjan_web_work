package com.gura.spring05.todo.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.todo.dto.TodoDto;

public interface TodoService {
	public void getList(ModelAndView mView);
	public void addTodo(TodoDto dto);
	public void getTodo(ModelAndView mView, int num);
	public void updateTodo(TodoDto dto);
	public void deleteTodo(int num);	
	public List<TodoDto> getqList(ModelAndView mView, String query);
}
