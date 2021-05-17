package com.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.service.Provider;
import com.model.MovieAction;
import com.model.MovieAction2;
import com.model.MovieInfoDTO;

@Controller
@RequestMapping("/user/movie/{service}")
public class MovieController {

	@Resource
	Provider pr;
	
	@RequestMapping
	public String view(@PathVariable String service) {
		return "user/page/movie/"+service;
	}
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		System.out.println("바디유알엘");
		return "moviemain";
	}
	
	@ModelAttribute("moviedata")
	Object mm(@PathVariable String service) {
		
		MovieAction res = pr.getContext().getBean("movielist", MovieAction.class);
		return res.execute();
	}
	
	@ModelAttribute("moviedetail")
	Object dd(HttpServletRequest req) {
		
		if(req.getParameter("ind") != null) {
			MovieAction2 res = pr.getContext().getBean("moviedetail", MovieAction2.class);
			System.out.println(req.getParameter("ind"));
			return res.execute(Integer.parseInt(req.getParameter("ind")) );
		}
		
		return null;
	}
	
	@ModelAttribute("moviedatabefore")
	Object mmBefore(@PathVariable String service) {
		
		MovieAction res = pr.getContext().getBean("moviebefore", MovieAction.class);
		return res.execute();
	}
	
	@ModelAttribute("moviedataafter")
	Object mmAfter(@PathVariable String service) {
		
		MovieAction res = pr.getContext().getBean("movieafter", MovieAction.class);
		return res.execute();
	}
	

}
