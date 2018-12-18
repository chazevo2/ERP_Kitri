package com.project.erp.surveyA;

import java.util.ArrayList;

public interface SurveyAService {
	void add(SurveyA a);
	SurveyA getBySnum(int snum);
	ArrayList<SurveyA> getByParent(int parent);
	ArrayList<SurveyA> getByQnum(int qnum_multiple);
	ArrayList<SurveyA> getByMnum(int mnum);
	ArrayList<SurveyA> getAll();
}
