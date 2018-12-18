package com.project.erp.surveyQ;

import java.util.ArrayList;

public interface SurveyQDao {
	void insert(SurveyQ q); //survey, question, multiplechoice 
	void insertS(SurveyQ q); //survey
	void insertQ(SurveyQ q); //question
	void insertM(SurveyQ q); //multiplechoice
	void update(SurveyQ q);
	void delete(int snum);
	SurveyQ selectBySnum(int snum);
	ArrayList<SurveyQ> selectByParent(int parent);
	ArrayList<SurveyQ> selectByTitle(String title);
	ArrayList<SurveyQ> selectByProgress(String progress);
	ArrayList<SurveyQ> selectAll();
}
