package com.project.erp.gradeCode;

import java.util.ArrayList;

public interface gradeCodeDao {
	void insert(GradeCode d);
	
	void update(GradeCode d);
	
	GradeCode selectByNum(String Num);
	
	GradeCode selectByName(String name);
	
	ArrayList<GradeCode> selectAll();
}
