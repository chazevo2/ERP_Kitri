package com.project.erp.mail;

import java.util.ArrayList;

public interface mailService {
	void add(Mail c);

	void edit(Mail c);

	void del(int num);

	Mail get(int num);

	ArrayList<Mail> gettAll(String getEmail);
}
