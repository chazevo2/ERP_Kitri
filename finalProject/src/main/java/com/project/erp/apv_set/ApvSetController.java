package com.project.erp.apv_set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.erp.member.Member;

@Controller
public class ApvSetController {
	@Resource(name = "apvSetService")
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}
	
	// 기안자 정보
	@RequestMapping("/approval/getSet")
	public ModelAndView getSet(@RequestParam(value="set") int set) {
		ModelAndView mav = new ModelAndView("/approval/setJson");
		Apv_set apv_set = service.getSet(set);
		mav.addObject("apv_set", apv_set);
		return mav;
	}
}
