package com.gura.spring05.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	//핵심 의존 객체를 spring 으로부터 주입받기(같은 type 일때 참조값을 자동으로 넣음)(Dependency Injection)
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MemberDto> getList() {
		List<MemberDto> list=session.selectList("member.getList");
		
		return list;
	}
	
	@Override
	public void delete(int num) {
		session.delete("member.delete",num); 
		//("mapper안의 namespace(member) . member안의 delete의 id",인자)
	}
	
	@Override
	public void insert(MemberDto dto) {
		session.insert("member.insert", dto);
		
	}
	
	@Override
	public MemberDto getData(int num) {
		MemberDto dto=session.selectOne("member.getData",num);
			
		
		return dto;
	}
	
	@Override
	public void update(MemberDto dto) {
		session.update("member.update",dto);
		
	}
	
	
}









