package com.project.erp.docs;

import java.util.ArrayList;

public interface Dao {
	void insert(Document d);
	
	Document select(int num);
	
	ArrayList<Document> selectAll();
	
	void update(Document d);
	
	void delete(int num);
}
