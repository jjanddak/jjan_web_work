package com.gura.spring05.file.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring05.file.dto.FileDto;

@Repository
public class FileDaoImpl implements FileDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getCount() {
		//업로드된 파일의 전체 개수를 select 해서
		int count=session.selectOne("file.getCount");
		//리턴
		return count;
	}
	
	@Override
	public List<FileDto> getList(FileDto dto) {
		List<FileDto> list=session.selectList("file.getList",dto);
		
		return list;
	}
	
	
	
	
	
}











