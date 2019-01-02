package com.project.erp.mail;

import java.util.ArrayList;

public interface mailDao {
	void insert(Mail c);

	void update(Mail c);

	void delete(int num);

	Mail select(int num);

	ArrayList<Mail> selectAll(String getEmail);
}
