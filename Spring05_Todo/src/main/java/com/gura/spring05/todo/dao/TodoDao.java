package com.gura.spring05.todo.dao;

import java.util.List;

import com.gura.spring05.todo.dto.TodoDto;

public interface TodoDao {
	public List<TodoDto> getList();
	public void delete(int num);
	public void insert(TodoDto dto);
	public TodoDto getData(int num);
	public void update(TodoDto dto);
	public List<TodoDto> getqList(String query);
}
