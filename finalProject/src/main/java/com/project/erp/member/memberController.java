package com.project.erp.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.erp.docs.Document;

@Controller
public class memberController {
	@Resource(name="memberService")
	private memberService service;
	private String defaultPath="D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\member\\";
	
	public void setService(memberService service) {
		this.service = service;
	}
	@RequestMapping("/member/joinForm")
	public void joinForm() {
		
	}	
	
	@RequestMapping("/member/join")
	public String join(Member m) {
		String id=m.getGradeCode();
		id+=String.valueOf(m.getDepartmentCode());
		m.setId(id);
		String email=m.getEmail()+"@naver.com";
		m.setEmail(email);
		MultipartFile f=m.getFile();
		if(f!=null) {
			String fileName=f.getOriginalFilename();
			File newFile=new File(defaultPath+fileName);
			try {
				f.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			m.setPicture("/member/"+fileName);
		}
		service.add(m);
		return "member/loginForm";
	}	
	@RequestMapping("/member/login")
	public String login(Member m, HttpServletRequest req) {
		String path="";	
		boolean flag=service.login(m);
		if(flag) {
			Member m1=service.getById(m.getId());
			HttpSession session=req.getSession();
			String remember=m1.getPicture();
			session.setAttribute("id", m1.getId());
			session.setAttribute("email", m1.getEmail());
			session.setAttribute("picture", m1.getPicture());
			session.setAttribute("name", m1.getName());
			path="redirect:/home";
		}else {
			path="member/loginForm";
		}
		return path;
	}
	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		String remember=(String) session.getAttribute("picture");
		session.removeAttribute("id");
		session.removeAttribute("email");
		session.removeAttribute("picture");
		session.removeAttribute("name");
		return "member/loginForm";
	}	
	@RequestMapping("/member/remember")
	public String remember(@RequestParam(value="id")String id, HttpServletRequest req) {
		HttpSession session=req.getSession();
		Member m=service.getById(id);
		if(m!=null) {
			session.setAttribute("rememberId", id);
			session.setAttribute("rememberImg", m.getPicture());
		}else {
			session.setAttribute("id", "");
			session.setAttribute("rememberImg", "");
		}
		return "member/loginForm";
	}
	
	@RequestMapping("/member/rememberNo")
	public String rememberNo(HttpServletRequest req) {
		HttpSession session=req.getSession(false);
		session.removeAttribute("rememberId");
		session.removeAttribute("rememberImg");
		return "member/loginForm";
	}
	
	@RequestMapping("/member/listByDepartmentCode")
	public ModelAndView list(@RequestParam(value="num")int num) {
		ModelAndView mav=new ModelAndView("member/listJson");
		ArrayList<Member> list=service.getByDepartmentCode(num);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("/member/editApproval")
	public String editApproval(@RequestParam(value="id")String id) {
		Member m=service.getById(id);
		m.setConfirm("y");
		service.edit(m);
		return "redirect:/departmentCode/adminForm1";
	}	
	@RequestMapping("/member/delete")
	public String delete(@RequestParam(value="id")String id) {
		Member m=service.getById(id);
		service.delete(id);
		return "redirect:/departmentCode/adminForm1";
	}	
	
	@RequestMapping("/member/searchIdForm")
	public String searchIdForm() {
		return "/member/searchIdForm";
	}
	
	@RequestMapping("/member/searchId")
	public ModelAndView searchId(@RequestParam(value="name")String name,@RequestParam(value="email")String email) {
		String path="";
		ArrayList<Member> list=service.getByName1(name);
		Member m1=null;
		for(Member m: list) {
			if(m.getEmail().equals(email)) {
				m1=m;
			}
		}
		if(m1==null) {
			path="member/false";
		}else {
			path="member/getJson";
		}
		ModelAndView mav=new ModelAndView(path);
		mav.addObject("m",m1);
		return mav;
	}	
	
	@RequestMapping("/member/searchPwdForm")
	public String searchPwdForm() {
		return "/member/searchPwdForm";
	}	
	
	@RequestMapping("/member/searchPwd")
	public ModelAndView searchPwd(@RequestParam(value="name")String name,@RequestParam(value="hp")String hp) {
		String path="";
		ArrayList<Member> list=service.getByName1(name);
		Member m1=null;
		for(Member m: list) {
			if(m.getHp().equals(hp)) {
				m1=m;
			}
		}
		if(m1==null) {
			path="member/false";
		}else {
			path="member/getJson";
		}
		ModelAndView mav=new ModelAndView(path);
		mav.addObject("m",m1);
		return mav;
	}	
	
	@RequestMapping("/member/doubleEmail")
	public ModelAndView doubleEmail(@RequestParam(value="email")String email) {
		String path="";
		ArrayList<Member> list=service.getAll();
		Member m1=null;
		for(Member m: list) {
			if(m.getEmail().equals(email+"@naver.com")) {
				m1=m;
			}
		}
		if(m1==null) {
			path="member/false";
		}else {
			path="member/getJson";
		}
		ModelAndView mav=new ModelAndView(path);
		mav.addObject("m",m1);
		return mav;
	}	
	
	@RequestMapping("/member/doubleHp")
	public ModelAndView doubleHp(@RequestParam(value="hp")String hp) {
		String path="";
		ArrayList<Member> list=service.getAll();
		Member m1=null;
		for(Member m: list) {
			if(m.getHp().equals(hp)) {
				m1=m;
			}
		}
		if(m1==null) {
			path="member/false";
		}else {
			path="member/getJson";
		}
		ModelAndView mav=new ModelAndView(path);
		mav.addObject("m",m1);
		return mav;
	}
	
	// 결재선 지정
	@RequestMapping(value = "/member/getApvId", method = RequestMethod.POST)
	public ModelAndView getApvId(@RequestParam(value="name") String name) {
		ModelAndView mav = new ModelAndView("/member/listJson");
		ArrayList<Member> list = service.getByName(name);
		mav.addObject("list", list);
		return mav;
	}
	
	// 기안자 정보
	@RequestMapping(value = "/member/getName", method = RequestMethod.POST)
	public ModelAndView getName(@RequestParam(value="id") String id) {
		ModelAndView mav = new ModelAndView("/member/getJson");
		Member m = service.getById(id);
		mav.addObject("m", m);
		return mav;
	}
}
