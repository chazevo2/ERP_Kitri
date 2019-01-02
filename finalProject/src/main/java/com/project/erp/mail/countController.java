package com.project.erp.mail;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class countController {
	@Resource(name = "countService")
	private countService service;

	public void setService(countService service) {
		this.service = service;
	}

	@RequestMapping("/mail/count")
	public ModelAndView listJson(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/mail/getJson");
		HttpSession session = req.getSession(false);
		String getEmail = (String) session.getAttribute("email");
		if (service.get(getEmail) != null) {
			Count c = service.get(getEmail);
			mav.addObject("c", c);
		} else {
			mav = new ModelAndView("/mail/getJson1");
		}
		return mav;
	}
}
