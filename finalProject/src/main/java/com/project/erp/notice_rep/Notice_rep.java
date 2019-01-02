package com.project.erp.notice_rep;

import java.sql.Date;

public class Notice_rep {
	private int num;
	private Date w_date;
	private String writer;
	private String content;
	private int n_num;

	public Notice_rep() {
	}

	public Notice_rep(int num, Date w_date, String writer, String content, int n_num) {

		this.num = num;
		this.w_date = w_date;
		this.writer = writer;
		this.content = content;
		this.n_num = n_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	@Override
	public String toString() {
		return "Notice_rep [num=" + num + ", w_date=" + w_date + ", writer=" + writer + ", content=" + content + ", n_num=" + n_num + "]";
	}

}