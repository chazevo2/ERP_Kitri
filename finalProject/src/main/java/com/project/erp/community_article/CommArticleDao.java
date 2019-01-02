package com.project.erp.community_article;

import java.util.ArrayList;

public interface CommArticleDao {
	void insert(Community_Article ca);

	void update(Community_Article ca);

	void delete(int num);

	ArrayList<Community_Article> selectByCommNum(int comm_num);

	ArrayList<Community_Article> selectAll();
}
