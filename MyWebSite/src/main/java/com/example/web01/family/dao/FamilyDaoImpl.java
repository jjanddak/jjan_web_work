package com.example.web01.family.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.web01.family.dto.FamilyDto;

@Repository
public class FamilyDaoImpl implements FamilyDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<FamilyDto> getList() {
		List<FamilyDto> list=session.selectList("family.getList");
		
		return list;
	}

	@Override
	public void delete(int num) {
		session.delete("family.delete",num); 
	}

	@Override
	public void insert(FamilyDto dto) {
		session.insert("family.insert", dto);
	}

	@Override
	public FamilyDto getData(int num) {
		FamilyDto dto=session.selectOne("family.getData",num);
			
		
		return dto;
	}

	@Override
	public void update(FamilyDto dto) {
		session.update("family.update",dto);
	}

}
