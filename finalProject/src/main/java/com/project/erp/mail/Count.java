package com.project.erp.mail;

public class Count {
	private int num;
	private String getEmail;

	public Count() {
	}

	public Count(int num, String getEmail) {
		this.num = num;
		this.getEmail = getEmail;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getGetEmail() {
		return getEmail;
	}

	public void setGetEmail(String getEmail) {
		this.getEmail = getEmail;
	}

	@Override
	public String toString() {
		return "Count [num=" + num + ", getEmail=" + getEmail + "]";
	}
}
