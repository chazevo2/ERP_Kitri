package com.project.erp.surveyQ;

import java.util.ArrayList;

public interface SurveyQService {
	void add(SurveyQ q);

	void addS(SurveyQ q);

	void addQ(SurveyQ q);

	void addM(SurveyQ q);

	void edit(SurveyQ q); // title, question, atype, attach

	void delete(int snum);

	SurveyQ selectBySnum(int snum);

	ArrayList<SurveyQ> getByParent(int parent);

	ArrayList<SurveyQ> getByTitle(String title);

	ArrayList<SurveyQ> getByProgress(String progress);

	ArrayList<SurveyQ> getAll();
}
