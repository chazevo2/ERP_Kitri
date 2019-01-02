package com.project.erp.gradeCode;

public class GradeCode {
	private String num;
	private String name;

	public GradeCode() {

	}

	public GradeCode(String num, String name) {
		this.num = num;
		this.name = name;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
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
		return "GradeCode [num=" + num + ", name=" + name + "]";
	}
}
