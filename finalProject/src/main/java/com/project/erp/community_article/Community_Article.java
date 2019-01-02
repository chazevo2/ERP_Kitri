package com.project.erp.community_article;

import java.sql.Date;

public class Community_Article {
	private int num;
	private String writer;
	private String content;
	private Date w_date;
	private int comm_num;

	public Community_Article() {
	}

	public Community_Article(int num, String writer, String content, Date w_date, int comm_num) {
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.w_date = w_date;
		this.comm_num = comm_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	public int getComm_num() {
		return comm_num;
	}

	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}

	@Override
	public String toString() {
		return "Community_Article [num=" + num + ", writer=" + writer + ", content=" + content + ", w_date=" + w_date + ", comm_num=" + comm_num + "]";
	}

}
