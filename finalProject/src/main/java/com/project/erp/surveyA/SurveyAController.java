package com.project.erp.surveyA;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SurveyAController {
	@Resource(name = "surveyAService")
	private SurveyAService service;

	public void setService(SurveyAService service) {
		this.service = service;
	}

	@RequestMapping("/surveyA/answerForm")
	public String answer() {
		return "surveyA/respond";
	}

	@RequestMapping("/surveyA/answerForm1")
	public ModelAndView answerForm1() {
		ModelAndView mav = new ModelAndView("Main");
		mav.addObject("sub", "/surveyA/respond");
		return mav;
	}

	@RequestMapping("/surveyA/respond")
	public ModelAndView respond(@RequestParam(value = "parent") int parent) {
		ArrayList<SurveyA> list = service.getByParent(parent);
		System.out.println(list.get(0));
		ModelAndView mav = new ModelAndView("surveyA/respond.admin");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/surveyA/questionJson")
	public ModelAndView test(@RequestParam(value = "qnum_multiple") int qnum_multiple) {
		ArrayList<SurveyA> listQ = service.getByQnum(qnum_multiple);
		ModelAndView mav = new ModelAndView("/surveyA/questionJson");
		mav.addObject("listQ", listQ);
		return mav;
	}

	@RequestMapping("/surveyA/add")
	public ModelAndView add(SurveyA a) {
		service.add(a);
		ModelAndView mav = new ModelAndView("Main");
		mav.addObject("sub", "/surveyQ/list");
		return mav;
	}

}
