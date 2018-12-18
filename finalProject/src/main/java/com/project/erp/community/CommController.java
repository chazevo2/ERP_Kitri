package com.project.erp.community;

import java.util.ArrayList;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommController {
	@Resource(name="communityService")
	private CommService service;

	public void setService(CommService service) {
		this.service = service;
	}
	
	@RequestMapping("/community/gotoaddForm")
	public String gotoaddform() {
		return "community/addForm.admin";
	}
	
	@RequestMapping("/community/add")
	public String add(Community c) {
		String content = c.getContent().replace("\r\n", "<br>");
		c.setContent(content);
		service.add(c);
		return "redirect:/community/list";
	}
	
	@RequestMapping("/community/editForm")
	public ModelAndView editForm1(@RequestParam(value="num")int num){
		ModelAndView mav = new ModelAndView("community/editForm.admin");
		Community c = service.getByNum(num);
//		String Token = getRandomToken(5);
		service.editCNT(num);
		mav.addObject("c",c);
		return mav;
	}
	
	@RequestMapping("/community/edit")
	public String edit(Community c) {
		String content = c.getContent().replace("\r\n", "<br>");
		c.setContent(content);
		service.edit(c);
		return "redirect:/community/list";
	}
	
	@RequestMapping("/community/editNOP")
	public ModelAndView editNOP(@RequestParam(value="num")int num) {
		ModelAndView mav = new ModelAndView("/community/bynum_json");
		service.editNOP(num);
		Community c = service.getByNum(num);
		mav.addObject("c",c);
		return mav;
	}
	
	@RequestMapping("/community/editNOP2")
	public ModelAndView editNOP2(@RequestParam(value="num")int num) {
		ModelAndView mav = new ModelAndView("/community/bynum_json");
		service.editNOP2(num);
		Community c = service.getByNum(num);
		mav.addObject("c",c);
		return mav;
	}
	
	@RequestMapping("/community/delete")
	public String del(@RequestParam(value="num")int num) {
		service.del(num);
		return "redirect:/community/list";
	}
	
	@RequestMapping("/community/addAttandant")
	public ModelAndView addAttandant(Community c) {
		ModelAndView mav = new ModelAndView("/community/bynum_json");
		service.addAttandant(c);
		c = service.getByNum(c.getNum());
		mav.addObject("c",c);
		return mav;
	}
	
	@RequestMapping("/community/selectByTitle")
	public ModelAndView selectByTitle(@RequestParam(value="title")String title) {
		ModelAndView mav = new ModelAndView("community/search.admin");
		ArrayList<Community> list = service.getComm(title);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("/community/list")
	public String list() {
		return "community/list.admin";
	}
	
	
	@RequestMapping("/community/getList")
	public ModelAndView getlist() {
		ModelAndView mav = new ModelAndView("/community/list_json");
		ArrayList<Community> list = service.getAll();
		mav.addObject("list", list);
		return mav;
	}
	
//	public String getRandomToken( int length ){
//
//        char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
//        StringBuffer sb = new StringBuffer();
//        Random rn = new Random();
//
//        for( int i = 0 ; i < length ; i++ ){
//            sb.append( charaters[ rn.nextInt( charaters.length ) ] );
//        }
//        return sb.toString();
//
//    }



}
