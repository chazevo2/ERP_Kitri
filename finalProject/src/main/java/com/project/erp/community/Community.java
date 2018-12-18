package com.project.erp.community;

import java.sql.Date;

public class Community {
	private int num;
	private String title;
	private String content;
	private String writer;
	private String location;
	private Date w_date;
	private int nop;
	private int maxnop;
	private int clickcnt;
	private String attandant;

	public Community() {
	}

	public Community(int num, String title, String content, String writer, String location, Date w_date, int nop,
			int maxnop, int clickcnt, String attandant) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.location = location;
		this.w_date = w_date;
		this.nop = nop;
		this.maxnop = maxnop;
		this.clickcnt = clickcnt;
		this.attandant = attandant;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	public int getNop() {
		return nop;
	}

	public void setNop(int nop) {
		this.nop = nop;
	}

	public int getMaxnop() {
		return maxnop;
	}

	public void setMaxnop(int maxnop) {
		this.maxnop = maxnop;
	}

	public int getClickcnt() {
		return clickcnt;
	}

	public void setClickcnt(int clickcnt) {
		this.clickcnt = clickcnt;
	}

	public String getAttandant() {
		return attandant;
	}

	public void setAttandant(String attandant) {
		this.attandant = attandant;
	}

	@Override
	public String toString() {
		return "Community [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", location=" + location + ", w_date=" + w_date + ", nop=" + nop + ", maxnop=" + maxnop
				+ ", clickcnt=" + clickcnt + ", attandant=" + attandant + "]";
	}

	
	
}