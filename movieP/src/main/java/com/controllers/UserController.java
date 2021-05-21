package com.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("user/main")
public class UserController {

	@RequestMapping
	public String view(HttpServletRequest request, HttpSession session) {

		session.setAttribute("sessionId", request.getParameter("userid") );
		return "/user/home";
	}
	
}