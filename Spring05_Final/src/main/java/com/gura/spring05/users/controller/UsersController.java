package com.gura.spring05.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {
	@RequestMapping("/users/signup_form")
	public String signup_form() {
		
		return "users/signup_form";
	}
}
