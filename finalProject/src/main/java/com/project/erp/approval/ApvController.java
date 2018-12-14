package com.project.erp.approval;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApvController {
	@Resource(name = "apvService")
	private Service service;
	private String defaultPath = "D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\approvals\\";

	public void setService(Service service) {
		this.service = service;
	}

	@RequestMapping(value = "/approval/write", method = RequestMethod.GET)
	public void write() {

	}

	@RequestMapping(value = "/approval/write", method = RequestMethod.POST)
	public ModelAndView write(Approval a, @RequestParam(name = "content") String content) {
		String date = new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(Calendar.getInstance().getTime());
		String filename1 = date + ".html";
		String filename2 = date + ".txt";		
		File file1 = new File(defaultPath + filename1);
		File file2 = new File(defaultPath + filename2);
		String log = a.getId() + " / " + date + " / »ý¼º;"; 
		try {
			BufferedWriter bw1 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file1), "UTF-8"));
			BufferedWriter bw2 = new BufferedWriter(new FileWriter(file2, true));
			bw1.write(content);
			bw2.write(log);
			bw1.flush();
			bw2.flush();
			bw1.close();
			bw2.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(a.getMid_id() == null && a.getFnl_id() == null) {
			a.setApv_set_num(4);
		} else {
			a.setApv_set_num(1);
		}
		a.setPath("/approvals/" + filename1);
		a.setLog("/approvals/" + filename2);
		service.addApv(a);
		ModelAndView mav = new ModelAndView("Main");
		mav.addObject("sub", "/approval/approve");
		return mav;
	}

	@RequestMapping(value = "/approval/getApvId", method = RequestMethod.GET)
	public void getApvId() {

	}

	@RequestMapping("/approval/approve")
	public void approve(HttpServletRequest req, Model m) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		ArrayList<Approval> list = service.getById(id);
		m.addAttribute("list", list);
	}

	@RequestMapping("/approval/apvList")
	public ModelAndView apvList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/approval/apvJson");
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		ArrayList<Approval> list = service.getById(id);
		mav.addObject("list", list);
		System.out.println(list);
		return mav;
	}

	@RequestMapping("/approval/detail")
	public void detail(@RequestParam(name = "num") int num, Model m) {
		Approval approval = service.getApv(num);
		m.addAttribute("approval", approval);
	}
}
