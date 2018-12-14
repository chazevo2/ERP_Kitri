package com.project.erp.approval;

import java.util.ArrayList;

public interface Service {
	void addApv(Approval a);

	Approval getApv(int num);

	ArrayList<Approval> getById(String id);

	ArrayList<Approval> getAll();

	void editApv(Approval a);

	void delApv(int num);
}
