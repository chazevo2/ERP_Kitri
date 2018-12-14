package com.project.erp.gradeCode;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class gradeCodeController {
   @Resource(name="gradeCodeService")
   private gradeCodeService service;
   
   @RequestMapping("/gradeCode/addForm")
   public String addForm() {
      return "gradeCode/addForm";
   }
   
   @RequestMapping("/gradeCode/add")
   public String add(GradeCode d) {
      service.add(d);
      return "gradeCode/addForm";
   }
   
   @RequestMapping("/gradeCode/list")
   public ModelAndView list() {
      ModelAndView mav=new ModelAndView("gradeCode/listJson");
      ArrayList<GradeCode> list= service.getInfoAll();
      mav.addObject("list", list);
      return mav;
   }
   
   @RequestMapping("/gradeCode/get")
   public ModelAndView get(@RequestParam(value="num") String num) {
      ModelAndView mav=new ModelAndView("gradeCode/getJson");
      GradeCode g= service.getInfoByNum(num);
      mav.addObject("g", g);
      return mav;
   }
   
}