package com.gura.spring05.file.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring05.file.service.FileService;

@Controller
public class FileController {
	@Autowired
	private FileService service;
	
	@RequestMapping("/file/list")
	public ModelAndView list(ModelAndView mView) {
		
		
		
		
		return null;
	}
	
}
