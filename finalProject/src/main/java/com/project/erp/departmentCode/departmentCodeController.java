package com.project.erp.departmentCode;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.erp.gradeCode.GradeCode;

@Controller
public class departmentCodeController {
	@Resource(name="departmentCodeService")
	private departmentCodeService service;
	
	@RequestMapping("/departmentCode/addForm")
	public void addForm() {
		
	}
	
	@RequestMapping("/departmentCode/add")
	public void addF() {
		
	}
	
	@RequestMapping("/departmentCode/getByName")
	public ModelAndView getByName(@RequestParam(value="")String name) {
		ModelAndView mav=new ModelAndView("");
		DepartmentCode d=service.getInfoByName(name);
		mav.addObject("d", d);
		return mav;
	}
	
	@RequestMapping("/departmentCode/getByNum")
	public ModelAndView getByNum1(@RequestParam(value="num")int num) {
		ModelAndView mav=new ModelAndView("departmentCode/getJson");
		DepartmentCode code=service.getInfoByNum(num);
		mav.addObject("code", code);
		return mav;
	}

	@RequestMapping("/departmentCode/list")
	public ModelAndView getAll() {
		ModelAndView mav=new ModelAndView("departmentCode/listJson");
		ArrayList<DepartmentCode> list=service.getInfoAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/departmentCode/adminForm1")
	public ModelAndView adminForm1() {
		ModelAndView mav=new ModelAndView("Main");
		ArrayList<DepartmentCode> list=service.getInfoAll();
		mav.addObject("list",list);
		mav.addObject("sub","/departmentCode/adminForm");
		return mav;
	}
	@RequestMapping("/departmentCode/adminForm")
	public String adminForm() {
		return "member/adminForm";
	}
}
