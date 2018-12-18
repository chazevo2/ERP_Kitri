package com.project.erp.notice;

import java.util.ArrayList;

public interface noticeService {
	void add(Notice n);
	void edit(Notice n);
	void del(int num);
	Notice getByNum(int num);
	ArrayList<Notice> selectAll();
	ArrayList<Notice> selectByTitle(String title);
	ArrayList<Notice> selectByWriter(String writer);
	ArrayList<Notice> selectByContent(String content);
	int count(int view_count);
}
