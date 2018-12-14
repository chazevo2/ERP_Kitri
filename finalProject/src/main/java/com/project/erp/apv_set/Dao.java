package com.project.erp.apv_set;

import java.util.ArrayList;

public interface Dao {
	void insert(Apv_set a);
	
	Apv_set select(int num);
	
	ArrayList<Apv_set> selectAll();
	
	void update(Apv_set a);
	
	void delete(int num);
}
