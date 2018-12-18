package com.project.erp.notice;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.erp.notice_rep.Notice_rep;
import com.project.erp.notice_rep.notice_repService;

@Controller
public class noticeController {
	@Resource(name = "noticeService")
	private noticeService service;
	
	@Resource(name = "notice_repService")
	private notice_repService service2;

	public void setService(noticeService service) {
		this.service = service;
	}

	@RequestMapping("/notice/addForm")
	public String addForm() {
		return "notice/add.admin";
	}

	@RequestMapping(value = "/notice/add", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String add(Notice n) {
		service.add(n);
		return "redirect:/notice/list";
		//URL�ΰ��°�
	}
	@RequestMapping("/notice/list")
	public ModelAndView list1() {
		ModelAndView mav=new ModelAndView("notice/list.admin");
		ArrayList<Notice> list = service.selectAll();
		mav.addObject("list", list);
		ArrayList<Notice_rep> listR = service2.selectAll();
		mav.addObject("listR", listR);
		return mav;
		//JSP
	}
	
	@RequestMapping(value="/notice/selectList", produces="text/plain;charset=UTF-8")
	public ModelAndView selectList1(@RequestParam(value="title")String title) {
		ModelAndView mav=new ModelAndView("notice/list.admin");
		ArrayList<Notice> list = service.selectByTitle(title);
		mav.addObject("list", list);
		ArrayList<Notice_rep> listR = service2.selectAll();
		mav.addObject("listR", listR);
		return mav;
	}
	
	
	@RequestMapping(value="/notice/editForm")
	public ModelAndView editForm(@RequestParam(value="num")int num) {
		ModelAndView mav = new ModelAndView("notice/editForm");
		Notice n = service.getByNum(num);
		mav.addObject("n",n);
		
		return mav;
	}
	@RequestMapping("/notice/edit")
	public String edit(Notice n) {
		service.edit(n);
		return "redirect:/notice/list";
	}
	
	@RequestMapping("/notice/del")
	public String del(@RequestParam(value="num")int num) {
		int a = num;
		service2.del2(a);
		service.del(a);
		return "redirect:/notice/list";
	}
	@RequestMapping("/notice/detail")
	public ModelAndView detail1(@RequestParam(value="num")int num) {
		System.out.println(num);
		ModelAndView mav = new ModelAndView("notice/detail.admin");
		Notice n = service.getByNum(num);
		int count = service.count(num);
		System.out.println(count);
		ArrayList<Notice_rep> listR = service2.selectAll();
		mav.addObject("listR", listR);
		mav.addObject("n",n);
		mav.addObject("count",count);
		return mav;
	}
}
