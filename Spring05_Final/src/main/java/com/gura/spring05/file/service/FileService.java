package com.gura.spring05.file.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface FileService {
	public void list(HttpServletRequest request);
}
