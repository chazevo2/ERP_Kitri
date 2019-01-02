package com.project.erp.notice_rep;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.project.erp.notice.noticeService;

@Controller
public class notice_repController {
	@Resource(name = "notice_repService")
	private notice_repService service;

	@Resource(name = "noticeService")
	private noticeService noticeService;

	public void setService(notice_repService service) {
		this.service = service;
	}

	@RequestMapping(value = "/notice_rep/add", produces = "text/plain;charset=UTF-8")
	public ModelAndView add(Notice_rep nr) {
		service.add(nr);
		ArrayList<Notice_rep> list = service.selectByN_num(nr.getN_num());
		ModelAndView mav = new ModelAndView("notice/repList");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/notice_rep/list")
	public ModelAndView list(@RequestParam(value = "n_num") int n_num) {
		ArrayList<Notice_rep> list = service.selectByN_num(n_num);
		ModelAndView mav = new ModelAndView("notice/repList");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/notice_rep/del")
	public void del(@RequestParam(value = "rnum") int rnum) {
		service.del(rnum);
	}

}
