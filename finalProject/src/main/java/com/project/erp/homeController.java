package com.project.erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class homeController {

	@RequestMapping("/")
	public String login() {
		return "member/loginForm";
	}

	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("Main");
		mav.addObject("sub", "/main1");
		return mav;
	}

}