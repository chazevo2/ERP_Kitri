package com.project.erp.mail;

public class Mail {
	private int num;
	private String sendEmail;
	private String title;
	private String getEmail;
	private String content;
	private String read;
	
	public Mail() {
		
	}

	public Mail(int num, String sendEmail, String title, String getEmail, String content, String read) {
		this.num = num;
		this.sendEmail = sendEmail;
		this.title = title;
		this.getEmail = getEmail;
		this.content = content;
		this.read = read;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSendEmail() {
		return sendEmail;
	}

	public void setSendEmail(String sendEmail) {
		this.sendEmail = sendEmail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGetEmail() {
		return getEmail;
	}

	public void setGetEmail(String getEmail) {
		this.getEmail = getEmail;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	@Override
	public String toString() {
		return "Chat [num=" + num + ", sendEmail=" + sendEmail + ", title=" + title + ", getEmail=" + getEmail
				+ ", content=" + content + ", read=" + read + "]";
	}
}
