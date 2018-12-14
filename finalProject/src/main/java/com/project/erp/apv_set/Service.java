package com.project.erp.apv_set;

import java.util.ArrayList;

public interface Service {
	void addSet(Apv_set a);

	Apv_set getSet(int num);

	ArrayList<Apv_set> getAll();

	void editSet(Apv_set a);

	void delSet(int num);
}
