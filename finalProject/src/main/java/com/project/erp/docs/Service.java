package com.project.erp.docs;

import java.util.ArrayList;

public interface Service {
	void addDocument(Document d);

	Document getDocument(int num);

	ArrayList<Document> getAll();

	void editDocument(Document d);

	void delDocument(int num);
}
