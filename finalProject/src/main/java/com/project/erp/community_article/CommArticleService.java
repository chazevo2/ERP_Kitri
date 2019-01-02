package com.project.erp.community_article;

import java.util.ArrayList;

public interface CommArticleService {
	void add(Community_Article ca);

	void edit(Community_Article ca);

	void del(int num);

	ArrayList<Community_Article> getByCommNum(int comm_num);

	ArrayList<Community_Article> getAll();
}
