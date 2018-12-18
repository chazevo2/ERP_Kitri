package com.project.erp.notice;

import java.sql.Date;

public class Notice {
	private int num;
	private Date w_date;
	private String title;
	private String content;
	private String writer;
	private int view_count;
	
	public Notice() {
		
	}
	
	public Notice(int num, Date w_date, String title, String content, String writer, int view_count) {
		this.num = num;
		this.w_date = w_date;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.view_count = view_count;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	@Override
	public String toString() {
		return "Notice [num=" + num + ", w_date=" + w_date + ", title=" + title + ", content=" + content + ", writer="
				+ writer + ", view_count=" + view_count + "]";
	}

	
	
	
}
