package com.project.erp.notice_rep;

import java.util.ArrayList;

public interface notice_repService {
	void add(Notice_rep nr);

	void del(int num);

	void del2(int n_num);

	ArrayList<Notice_rep> selectByN_num(int n_num);

	ArrayList<Notice_rep> selectAll();
}
