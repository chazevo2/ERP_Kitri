package com.project.erp.departmentCode;

import java.util.ArrayList;

public interface departmentCodeService {
	void add(DepartmentCode d);

	void edit(DepartmentCode d);

	DepartmentCode getInfoByNum(int num);

	DepartmentCode getInfoByName(String name);

	ArrayList<DepartmentCode> getInfoAll();
}
