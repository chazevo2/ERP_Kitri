package com.project.erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class homeController {
	
	@RequestMapping("/")
	public String login() {
		return "member/loginForm";
	}
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mav=new ModelAndView("Main");
		mav.addObject("sub", "/main1");
		return mav;
	}
		
	@RequestMapping("/main")
	public ModelAndView main(@RequestParam(value="sub")String sub) {
		ModelAndView mav=new ModelAndView("Main");
		mav.addObject("sub", sub);
		return mav;
	}
	
	@RequestMapping("/main1")
	public String main1() {
		return "main/menu1";
	}
	
	@RequestMapping("/main2")
	public String main2() {
		return "main/menu2";
	}
	
	@RequestMapping("/main3")
	public String main3() {
		return "main/menu3";
	}
	
	@RequestMapping("/main4")
	public String main4() {
		return "main/menu4";
	}
	
	@RequestMapping("/main5")
	public String main5() {
		return "main/menu5";
	}
	
	@RequestMapping("/main6")
	public String main6() {
		return "main/menu6";
	}
	
	@RequestMapping("/main7")
	public String main7() {
		return "main/menu7";
	}
	@RequestMapping("/main8")
	public String main8() {
		return "survey/1";
	}
	@RequestMapping("/main9")
	public String main9() {
		return "main/menu9";
	}
}