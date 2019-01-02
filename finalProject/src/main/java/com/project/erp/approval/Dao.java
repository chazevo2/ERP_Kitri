package com.project.erp.approval;

import java.util.ArrayList;

public interface Dao {
	void insert(Approval a);

	Approval select(int num);

	ArrayList<Approval> selectById(String id);

	ArrayList<Approval> selectAll();

	void update(Approval a);

	void delete(int num);
}
