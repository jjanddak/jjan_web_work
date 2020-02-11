package com.gura.spring05.cafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.cafe.dao.CafeDao;
import com.gura.spring05.cafe.dto.CafeDto;

@Service
public class CafeServiceImpl implements CafeService{
	
	@Autowired
	private CafeDao dao;
	
	@Override
	public void list(ModelAndView mView) {
		
		List<CafeDto> list=dao.getList();
		
		mView.addObject("list",list);
	}
}
