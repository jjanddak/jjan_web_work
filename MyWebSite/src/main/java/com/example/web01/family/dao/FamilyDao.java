package com.example.web01.family.dao;

import java.util.List;

import com.example.web01.family.dto.FamilyDto;

public interface FamilyDao {
	public List<FamilyDto> getList();
	public void delete(int num);
	public void insert(FamilyDto dto);
	public FamilyDto getData(int num);
	public void update(FamilyDto dto);
}
