package com.project.erp.approval;

import java.sql.Date;

public class Approval {
	private int num;
	private String id;
	private String mid_id;
	private String fnl_id;
	private int apv_set_num;
	private String title;
	private Date apv_date;
	private String path;
	private String rejection;
	private String log;

	public Approval() {
	}

	public Approval(int num, String id, String mid_id, String fnl_id, int apv_set_num, String title, Date apv_date, String path, String rejection, String log) {
		this.num = num;
		this.id = id;
		this.mid_id = mid_id;
		this.fnl_id = fnl_id;
		this.apv_set_num = apv_set_num;
		this.title = title;
		this.apv_date = apv_date;
		this.path = path;
		this.rejection = rejection;
		this.log = log;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMid_id() {
		return mid_id;
	}

	public void setMid_id(String mid_id) {
		this.mid_id = mid_id;
	}

	public String getFnl_id() {
		return fnl_id;
	}

	public void setFnl_id(String fnl_id) {
		this.fnl_id = fnl_id;
	}

	public int getApv_set_num() {
		return apv_set_num;
	}

	public void setApv_set_num(int apv_set_num) {
		this.apv_set_num = apv_set_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getApv_date() {
		return apv_date;
	}

	public void setApv_date(Date apv_date) {
		this.apv_date = apv_date;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getRejection() {
		return rejection;
	}

	public void setRejection(String rejection) {
		this.rejection = rejection;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	@Override
	public String toString() {
		return "Approval [num=" + num + ", id=" + id + ", mid_id=" + mid_id + ", fnl_id=" + fnl_id + ", apv_set_num=" + apv_set_num + ", title=" + title + ", apv_date=" + apv_date + ", path=" + path + ", rejection=" + rejection + ", log=" + log + "]";
	}

}
