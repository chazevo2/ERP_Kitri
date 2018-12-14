package com.project.erp.apv_set;

public class Apv_set {
	private int num;
	private String status;

	public Apv_set() {
	}

	public Apv_set(int num, String status) {
		this.num = num;
		this.status = status;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Apv_set [num=" + num + ", status=" + status + "]";
	}

}
