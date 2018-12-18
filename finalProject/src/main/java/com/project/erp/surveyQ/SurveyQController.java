package com.project.erp.surveyQ;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SurveyQController {
	@Resource(name = "surveyQService")
	private SurveyQService service;

	
	public void setService(SurveyQService service) {
		this.service = service;
	}
	
	@RequestMapping("/surveyQ/addForm")
	public String addForm() {
		return "surveyQ/addForm.admin";
	}

	@RequestMapping("/surveyQ/add")
	public String add(SurveyQ q) {
		service.add(q);
		return "redirect:/surveyQ/list";
	}
	
	
//	@RequestMapping("/surveyQ/addQ")
//	public ModelAndView addQ(SurveyQ q) {
//		service.addQ(q);
//		ModelAndView mav = new ModelAndView("Main");// 고정
//		mav.addObject("sub", "/surveyQ/list");// "/survey/addForm" 가고싶은 url
//		return mav;
//	}
	
	@RequestMapping("/surveyQ/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("surveyQ/list.admin");
		ArrayList<SurveyQ> list = service.getAll();
//		System.out.println(list);
		mav.addObject("list", list);
		return mav;
	}
}