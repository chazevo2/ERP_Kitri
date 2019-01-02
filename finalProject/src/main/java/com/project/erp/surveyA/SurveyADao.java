package com.project.erp.surveyA;

import java.util.ArrayList;

public interface SurveyADao {
	void insert(SurveyA a);

	SurveyA selectBySnum(int snum); // ���������� Ÿ��Ʋ ���

	ArrayList<SurveyA> selectByParent(int parent);

	ArrayList<SurveyA> selectByQnum(int qnum_multiple);

	ArrayList<SurveyA> selectByMnum(int mnum);

	ArrayList<SurveyA> selectAll();
}
