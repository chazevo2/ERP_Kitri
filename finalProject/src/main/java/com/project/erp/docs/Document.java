package com.project.erp.docs;

public class Document {
	private int num;
	private String title;
	private String path;

	public Document() {
	}

	public Document(int num, String title, String path) {
		this.num = num;
		this.title = title;
		this.path = path;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Documents [num=" + num + ", title=" + title + ", path=" + path + "]";
	}

}
