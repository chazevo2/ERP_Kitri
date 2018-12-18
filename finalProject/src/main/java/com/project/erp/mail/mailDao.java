package com.project.erp.mail;

import java.util.ArrayList;

public interface mailDao {
	void insert(Mail c);
	void update(Mail c);
	void delete(int num);
	Mail select(String getEmail);
	ArrayList<Mail> selectAll(String getEmail);
}
