package com.gura.spring05.cafe.dao;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.cafe.dto.CafeDto;

public interface CafeDao {
	public List<CafeDto> getList();
}
