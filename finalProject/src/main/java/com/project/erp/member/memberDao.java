package com.project.erp.member;

import java.util.ArrayList;

public interface memberDao {
	void insert(Member m);
	void update(Member m);
	void delete(String id);
	Member selectById(String id);
	ArrayList<Member> selectByDepartmentCode(int num);
	ArrayList<Member> selectByConfirm(String confirm);
	ArrayList<Member> selectByName(String name);
	ArrayList<Member> selectByName1(String name);
	ArrayList<Member> selectAll();
}
