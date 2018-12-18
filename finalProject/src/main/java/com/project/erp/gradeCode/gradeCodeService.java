package com.project.erp.gradeCode;

import java.util.ArrayList;

public interface gradeCodeService {
	void add(GradeCode d);
	
	void edit(GradeCode d);
	
	GradeCode getInfoByNum(String num);

	GradeCode getInfoByName(String name);

	ArrayList<GradeCode> getInfoAll();
}
