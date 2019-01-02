package com.project.erp.notice;

import java.util.ArrayList;

public interface noticeDao {
	void insert(Notice n);

	void update(Notice n);

	void delete(int num);

	Notice selectByNum(int num);

	ArrayList<Notice> selectAll();

	ArrayList<Notice> selectByTitle(String title);

	ArrayList<Notice> selectByWriter(String writer);

	ArrayList<Notice> selectByContent(String content);

	int count(int view_count);
}
