package com.project.erp.mail;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mailController {
	@Resource(name = "mailService")
	private mailService service;

	public void setService(mailService service) {
		this.service = service;
	}

	@RequestMapping("/mailList/list")
	public String go1() {
		return "mail/mailList.admin";
	}

	@RequestMapping("/mail/listJson")
	public ModelAndView listJson(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/mail/listJson");
		HttpSession session = req.getSession(false);
		String getEmail = (String) session.getAttribute("email");
		ArrayList<Mail> list = service.gettAll(getEmail);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/mail/chat")
	public String chat() {
		return "mail/mail";
	}

	@RequestMapping("/mail/addForm")
	public String addForm() {
		return "mail/mailAddForm.admin";
	}

	@RequestMapping("/mail/add")
	public void add(@RequestParam(value = "sendEmail") String sendEmail, @RequestParam(value = "title") String title, @RequestParam(value = "getEmail") String getEmail, @RequestParam(value = "content") String content) {
		String content1 = content.replace("\r\n", "<br><br>");
		System.out.println(content1);
		Mail m = new Mail(0, sendEmail, title, getEmail, content1, "n");
		service.add(m);
	}

	@RequestMapping("/mail/del")
	public ModelAndView del(@RequestParam(value = "num") int num, HttpServletRequest req) {
		service.del(num);
		ModelAndView mav = new ModelAndView("/mail/listJson");
		HttpSession session = req.getSession(false);
		String getEmail = (String) session.getAttribute("email");
		ArrayList<Mail> list = service.gettAll(getEmail);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/mail/detail")
	public ModelAndView detail(@RequestParam(value = "num") int num) {
		ModelAndView mav = new ModelAndView("mail/mailDetail.admin");
		Mail m = service.get(num);
		m.setRead("y");
		service.edit(m);
		mav.addObject("m", m);
		return mav;
	}
}
