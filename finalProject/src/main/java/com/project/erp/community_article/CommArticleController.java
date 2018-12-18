package com.project.erp.community_article;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CommArticleController {
	@Resource(name="commarticleservice")
	private CommArticleService service;

	public void setService(CommArticleService service) {
		this.service = service;
	}
	
	@RequestMapping("/community_article/add")
	public ModelAndView add(Community_Article ca) {
		ModelAndView mav = new ModelAndView("community_article/list_json");
		service.add(ca);
		ArrayList<Community_Article> list = service.getByCommNum(ca.getComm_num());
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("/community_article/delete")
	public ModelAndView delete(@RequestParam(value="num") int num, @RequestParam(value="comm_num") int comm_num) {
		ModelAndView mav = new ModelAndView("community_article/list_json");
		service.del(num);
		ArrayList<Community_Article> list = service.getByCommNum(comm_num);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("/community_article/getlist")
	public ModelAndView getlist(@RequestParam(value="com_num")int com_num) {
		ModelAndView mav = new ModelAndView("/community_article/list_json");
		System.out.println(com_num);
		ArrayList<Community_Article> list = service.getByCommNum(com_num);
		mav.addObject("list", list);
		return mav;
	}
}
