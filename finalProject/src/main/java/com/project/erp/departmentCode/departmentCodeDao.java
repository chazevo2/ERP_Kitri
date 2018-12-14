package com.project.erp.departmentCode;

import java.util.ArrayList;

public interface departmentCodeDao {
	void insert(DepartmentCode d);

	DepartmentCode selectByNum(int num);
	
	DepartmentCode selectByName(String name);

	ArrayList<DepartmentCode> selectAll();
}
