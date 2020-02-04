package com.gura.spring05.users.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gura.spring05.users.dao.UsersDao;
import com.gura.spring05.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDao dao;
	
	@Override
	public Map<String, Object> isExistId(String inputId) {
		boolean isExist=dao.isExist(inputId);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isExist", isExist);
		
		return map;
	}

	@Override
	public void addUser(UsersDto dto) {
		//비밀번호 암호화
		String encodedPwd=new BCryptPasswordEncoder().encode(dto.getPwd());
		//암호화된 비밀번호 UsersDto에 다시 넣기
		dto.setPwd(encodedPwd);
		//UsersDao 객체를 이용, DB에 저장
		dao.insert(dto);
	}
	
}
