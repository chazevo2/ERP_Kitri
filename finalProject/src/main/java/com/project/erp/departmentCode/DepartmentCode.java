package com.project.erp.departmentCode;

public class DepartmentCode {
	private int num;
	private String name;

	public DepartmentCode() {
	}

	public DepartmentCode(int num, String name) {
		this.num = num;
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "DepartmentCode [num=" + num + ", name=" + name + "]";
	}
}
