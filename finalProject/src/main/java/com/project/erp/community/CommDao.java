package com.project.erp.community;

import java.util.ArrayList;

public interface CommDao {
	void insert(Community c);

	void update(Community c);

	void updateNOP(int num);

	void updateNOP2(int num);

	void updateCNT(int num);

	void delete(int num);

	void insertAttandant(Community c);

	Community selectByNum(int num);

	ArrayList<Community> selectByTitle(String title);

	ArrayList<Community> selectAll();
}
