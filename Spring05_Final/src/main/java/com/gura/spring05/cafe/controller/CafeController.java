package com.gura.spring05.cafe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.cafe.service.CafeService;



@Controller
public class CafeController {
	@Autowired
	private CafeService service;
	
	@RequestMapping("/cafe/list")
	public ModelAndView list(ModelAndView mView) {
		
		service.list(mView);
		
		mView.setViewName("cafe/list");
		
		return mView;
	}
	
}
