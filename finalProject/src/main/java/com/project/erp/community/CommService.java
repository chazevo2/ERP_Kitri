package com.project.erp.community;

import java.util.ArrayList;

public interface CommService {
	
	void add(Community c);
	
	void edit(Community c);
	
	void editNOP(int num);
	
	void editNOP2(int num);
	
	void editCNT(int num);
	
	void del(int num);
	
	void addAttandant(Community c);
	
	Community getByNum(int num);
	
	ArrayList<Community> getComm(String title);
	
	ArrayList<Community> getAll();
}
