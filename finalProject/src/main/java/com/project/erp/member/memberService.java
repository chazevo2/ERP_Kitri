package com.project.erp.member;

import java.util.ArrayList;

public interface memberService {
	void add(Member m);
	void edit(Member m);
	void delete(String id);
	Member getById(String id);
	ArrayList<Member> getByConfirm(String confirm);
	ArrayList<Member> getByDepartmentCode(int num);
	ArrayList<Member> getByName(String name);
	ArrayList<Member> getByName1(String name);
	ArrayList<Member> getAll();
	boolean login(Member m);
	
}
