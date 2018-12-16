package com.project.erp.approval;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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

	@RequestMapping("/approval/write")
	public void write() {

	}

	@RequestMapping("/approval/write.do")
	public ModelAndView write(Approval a, @RequestParam(value = "content") String content) {
		String date = new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(Calendar.getInstance().getTime());
		String filename1 = date + ".html";
		String filename2 = date + ".txt";
		File file1 = new File(defaultPath + filename1);
		File file2 = new File(defaultPath + filename2);
		String log = a.getId() + " / " + date + " / 제출;:;";
		try {
			BufferedWriter bw1 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file1), "UTF-8"));
			BufferedWriter bw2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file2), "UTF-8"));
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

		a.setPath("/approvals/" + filename1);
		a.setLog("/approvals/" + filename2);
		System.out.println(a);
		service.addApv(a);
		ModelAndView mav = new ModelAndView("Main");
		mav.addObject("sub", "/approval/approve");
		return mav;
	}

	@RequestMapping("/approval/getApvId")
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
	public void detail(@RequestParam(value = "num") int num, Model m) {
		Approval approval = service.getApv(num);
		m.addAttribute("approval", approval);
	}

	@RequestMapping("/approval/approve.do")
	public ModelAndView approve(Approval a, @RequestParam(value = "content") String content) {
		String date = new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(Calendar.getInstance().getTime());
		String getlog = a.getLog();
		String[] split = getlog.split("/");
		String filename = split[split.length - 1];
		File file = new File(defaultPath + filename);
		int set = a.getApv_set_num();
		String status = "";
		if (set == 1) {
			status = "재기안";
			change(a.getPath(), content);
		} else if (set == 2 || set == 4) {
			status = "승인";
		} else if (set == 3 || set == 5) {
			status = "반려";
		} else {
			status = "반려 및 거부";
		}
		String log = a.getId() + " / " + date + " / " + status;
		if (a.getRejection() != "" && a.getRejection() != null && !a.getRejection().isEmpty()) {
			log += " / " + a.getRejection();
		}
		log += ";:;";
		try {
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, true), "UTF-8"));
			bw.write(log);
			bw.flush();
			bw.close();
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
		service.editApv(a);

		ModelAndView mav = new ModelAndView("Main");
		mav.addObject("sub", "/approval/approve");
		return mav;
	}

	public void change(String name, String content) {
		String[] split = name.split("/");
		String filename = split[split.length - 1];
		File file = new File(defaultPath + filename);
		try {
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
			bw.write(content);
			bw.flush();
			bw.close();
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

	}
}
