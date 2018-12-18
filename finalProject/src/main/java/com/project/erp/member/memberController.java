package com.project.erp.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class memberController {
	@Resource(name = "memberService")
	private memberService service;
	private String defaultPath = "D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\member\\";

	public void setService(memberService service) {
		this.service = service;
	}

	@RequestMapping("/member/joinForm")
	public void joinForm() {

	}

	@RequestMapping("/member/home")
	public String go() {
		return "main/Main.admin";
	}

	@RequestMapping("/member/join")
	public String join(Member m) {
		String id = m.getGradeCode();
		id += String.valueOf(m.getDepartmentCode());
		m.setId(id);
		String email = m.getEmail() + "@naver.com";
		MultipartFile f = m.getFile();
		String fileName = f.getOriginalFilename();
		int idx = fileName.lastIndexOf(".");
		String path = m.getEmail() + fileName.substring(idx);
		if (f != null) {
			File newFile = new File(defaultPath + path);
			try {
				f.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			m.setPicture("/member/" + path);
		}
		m.setEmail(email);
		service.add(m);
		return "member/loginForm";
	}

	@RequestMapping("/member/login")
	public String login(Member m, HttpServletRequest req) {
		String path = "";
		boolean flag = service.login(m);
		if (flag) {
			Member m1 = service.getById(m.getId());
			HttpSession session = req.getSession();
			session.setAttribute("id", m1.getId());
			session.setAttribute("name", m1.getName());
			session.setAttribute("email", m1.getEmail());
			path = "redirect:/member/home";
		} else {
			path = "member/loginForm";
		}
		return path;
	}

	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.invalidate();
		return "member/loginForm";
	}
	/*
	 * @RequestMapping("/member/remember") public String remember(@RequestParam(value="id")String id, HttpServletRequest req) { HttpSession session=req.getSession(); Member m=service.getById(id); if(m!=null) { session.setAttribute("rememberId", id); session.setAttribute("rememberImg", m.getPicture());
	 * }else { session.setAttribute("id", ""); session.setAttribute("rememberImg", ""); } return "member/loginForm"; }
	 */

	/*
	 * @RequestMapping("/member/rememberNo") public String rememberNo(HttpServletRequest req) { HttpSession session=req.getSession(false); session.removeAttribute("rememberId"); session.removeAttribute("rememberImg"); return "member/loginForm"; }
	 */

	@RequestMapping("/member/remember")
	public String remember(@RequestParam(value = "id") String id, HttpServletResponse response, HttpServletRequest request) {
		Member m = service.getById(id);
		String picture = m.getPicture();
		Cookie c = new Cookie("id", id);
		Cookie d = new Cookie("picture", picture);
		c.setPath("/");
		d.setPath("/");
		c.setMaxAge(60 * 60 * 24);
		d.setMaxAge(60 * 60 * 24);
		response.addCookie(c);
		response.addCookie(d);
		/*
		 * Cookie[] cookies = request.getCookies(); for(Cookie cookie: cookies) { System.out.println(cookie.getName()+":"+cookie.getValue()); }
		 */
		return "member/loginForm";
	}

	@RequestMapping("/member/rememberNo")
	public String rememberNo(HttpServletResponse response) {
		Cookie c = new Cookie("id", null);
		Cookie d = new Cookie("picture", null);
		c.setMaxAge(0);
		d.setMaxAge(0);
		response.addCookie(c);
		response.addCookie(d);
		return "member/loginForm";
	}

	@RequestMapping("/member/listByDepartmentCode")
	public ModelAndView list(@RequestParam(value = "num") int num) {
		ModelAndView mav = new ModelAndView("member/listJson");
		ArrayList<Member> list = service.getByDepartmentCode(num);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/member/editApproval")
	public void editApproval(@RequestParam(value = "id") String id) {
		Member m = service.getById(id);
		m.setConfirm("y");
		service.edit(m);
	}

	@RequestMapping("/member/delete")
	public void delete(@RequestParam(value = "id") String id, HttpServletResponse response) {
		Member m = service.getById(id);
		int idx = m.getPicture().lastIndexOf("/");
		String fileName = m.getPicture().substring(idx + 1);
		File f = new File(defaultPath + fileName);
		if (f != null) {
			f.delete();
		}
		Cookie c = new Cookie("id", null);
		Cookie d = new Cookie("picture", null);
		c.setMaxAge(0);
		d.setMaxAge(0);
		response.addCookie(c);
		response.addCookie(d);
		service.delete(id);
	}

	@RequestMapping("/member/searchIdForm")
	public String searchIdForm() {
		return "/member/searchIdForm";
	}

	@RequestMapping("/member/searchId")
	public ModelAndView searchId(@RequestParam(value = "name") String name, @RequestParam(value = "email") String email) {
		String path = "";
		ArrayList<Member> list = service.getByName1(name);
		Member m1 = null;
		for (Member m : list) {
			if (m.getEmail().equals(email)) {
				m1 = m;
			}
		}
		if (m1 == null) {
			path = "member/false";
		} else {
			path = "member/getJson";
		}
		ModelAndView mav = new ModelAndView(path);
		mav.addObject("m", m1);
		return mav;
	}

	@RequestMapping("/member/searchPwdForm")
	public String searchPwdForm() {
		return "/member/searchPwdForm";
	}

	@RequestMapping("/member/searchPwd")
	public ModelAndView searchPwd(@RequestParam(value = "name") String name, @RequestParam(value = "hp") String hp) {
		String path = "";
		ArrayList<Member> list = service.getByName1(name);
		Member m1 = null;
		for (Member m : list) {
			if (m.getHp().equals(hp)) {
				m1 = m;
			}
		}
		if (m1 == null) {
			path = "member/false";
		} else {
			path = "member/getJson";
		}
		ModelAndView mav = new ModelAndView(path);
		mav.addObject("m", m1);
		return mav;
	}

	@RequestMapping("/member/doubleEmail")
	public ModelAndView doubleEmail(@RequestParam(value = "email") String email) {
		String path = "";
		ArrayList<Member> list = service.getAll();
		Member m1 = null;
		for (Member m : list) {
			if (m.getEmail().equals(email + "@naver.com")) {
				m1 = m;
			}
		}
		if (m1 == null) {
			path = "member/false";
		} else {
			path = "member/getJson";
		}
		ModelAndView mav = new ModelAndView(path);
		mav.addObject("m", m1);
		return mav;
	}

	@RequestMapping("/member/doubleHp")
	public ModelAndView doubleHp(@RequestParam(value = "hp") String hp) {
		String path = "";
		ArrayList<Member> list = service.getAll();
		Member m1 = null;
		for (Member m : list) {
			if (m.getHp().equals(hp)) {
				m1 = m;
			}
		}
		if (m1 == null) {
			path = "member/false";
		} else {
			path = "member/getJson";
		}
		ModelAndView mav = new ModelAndView(path);
		mav.addObject("m", m1);
		return mav;
	}

	@RequestMapping("/member/editForm")
	public ModelAndView editForm(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Member m = service.getById(id);
		ModelAndView mav = new ModelAndView("member/editForm");
		mav.addObject("m", m);
		return mav;
	}

	@RequestMapping("/member/edit")
	public String edit(Member m) {
		MultipartFile f = m.getFile();
		Member m1 = service.getById(m.getId());
		String picture = m1.getPicture();
		String fileName = f.getOriginalFilename();
		if (!fileName.equals("")) {
			int idx = picture.lastIndexOf("/");
			String path = picture.substring(idx + 1);
			File file = new File(defaultPath + path);
			file.delete();
			idx = fileName.lastIndexOf(".");
			String imgPath = fileName.substring(idx);// String index out of range: -1
			int idx2 = m1.getEmail().lastIndexOf("@");
			String email = m.getEmail().substring(0, idx2);
			path = email + imgPath;//
			file = new File(defaultPath + path);
			m.setPicture("/member/" + path);
			if (m.getGradeCode() == null || m.getGradeCode().equals("")) {
				m.setGradeCode(m1.getGradeCode());
			}
			if (m.getDepartmentCode() == 0) {
				m.setDepartmentCode(m1.getDepartmentCode());
			}
			try {
				f.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			m.setPicture(picture);
			if (m.getGradeCode() == null || m.getGradeCode().equals("")) {
				m.setGradeCode(m1.getGradeCode());
			}
			if (m.getDepartmentCode() == 0) {
				m.setDepartmentCode(m1.getDepartmentCode());
			}
		}
		m.setConfirm(m1.getConfirm());
		service.edit(m);
		return "member/editResult";
	}

	@RequestMapping("/member/profile")
	public ModelAndView profile(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("member/getJson");
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Member m = service.getById(id);
		mav.addObject("m", m);
		return mav;
	}

	// 결재선 지정
	@RequestMapping(value = "/member/getApvId", method = RequestMethod.POST)
	public ModelAndView getApvId(@RequestParam(value = "name") String name) {
		ModelAndView mav = new ModelAndView("/member/listJson");
		ArrayList<Member> list = service.getByName(name);
		mav.addObject("list", list);
		return mav;
	}

	// 기안자 정보
	@RequestMapping(value = "/member/getName", method = RequestMethod.POST)
	public ModelAndView getName(@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView("/member/getJson");
		Member m = service.getById(id);
		mav.addObject("m", m);
		return mav;
	}
}
