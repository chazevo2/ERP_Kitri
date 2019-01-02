package com.project.erp.docs;

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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DocController {
	@Resource(name = "docService")
	private Service service;
	private String defaultPath = "D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\documents\\";

	public void setService(Service service) {
		this.service = service;
	}

	@RequestMapping("/approval/addDocument")
	public String addDocument() {
		return "approval/addDocument.admin";
	}

	@RequestMapping("/approval/saveDocument")
	public ModelAndView saveDocument(@RequestParam(value = "title") String title, @RequestParam(value = "content") String content) {
		String date = new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(Calendar.getInstance().getTime());
		String filename = date + ".html";
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

		Document d = new Document();
		d.setTitle(title);
		d.setPath("/documents/" + filename);
		service.addDocument(d);
		ModelAndView mav = new ModelAndView("redirect:/approval/write");
		return mav;
	}

	@RequestMapping("/approval/docsList")
	public ModelAndView docsList() {
		ModelAndView mav = new ModelAndView("/approval/docsJson");
		ArrayList<Document> list = service.getAll();
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/approval/docsManage")
	public String docsManage(Model m) {
		ArrayList<Document> list = service.getAll();
		m.addAttribute("list", list);
		return "approval/docsManage.admin";
	}

	@RequestMapping("/approval/docSave")
	public ModelAndView docSave(Document d, @RequestParam(value = "content") String content) {
		String[] split = d.getPath().split("/");
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

		service.editDocument(d);
		ModelAndView mav = new ModelAndView("redirect:/approval/docsManage");
		return mav;
	}

	@RequestMapping("/approval/docDel")
	public ModelAndView docDel(Document d) {
		String[] split = d.getPath().split("/");
		String filename = split[split.length - 1];
		File file = new File(defaultPath + filename);
		file.delete();

		service.delDocument(d.getNum());
		ModelAndView mav = new ModelAndView("redirect:/approval/docsManage");
		return mav;
	}
}
