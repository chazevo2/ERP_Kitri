package com.project.erp.notice_rep;

import java.util.ArrayList;

public interface notice_repDao {
	void insert(Notice_rep nr);
	void delete(int num);
	void delete2(int n_num);
	ArrayList<Notice_rep> selectByN_num(int n_num);
	ArrayList<Notice_rep> selectAll();
}
