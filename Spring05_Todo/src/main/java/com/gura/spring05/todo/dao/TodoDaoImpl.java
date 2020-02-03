package com.gura.spring05.todo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.todo.dto.TodoDto;

@Repository
public class TodoDaoImpl implements TodoDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<TodoDto> getList() {
		List<TodoDto> list=session.selectList("todo.getList");
		
		return list;
	}
	
	@Override
	public void delete(int num) {
		session.delete("todo.delete",num);
	}
	
	@Override
	public void insert(TodoDto dto) {
		session.insert("todo.insert",dto);	
	}
	
	@Override
	public TodoDto getData(int num) {
		TodoDto dto=session.selectOne("todo.getData",num);
		
		return dto;
	}
	
	@Override
	public void update(TodoDto dto) {
		session.update("todo.update",dto);
	}	
	
	@Override
	public List<TodoDto> getqList(String query) {
		List<TodoDto> list=session.selectList("todo.getqList",query);
		
		return list;
	}
	
}
