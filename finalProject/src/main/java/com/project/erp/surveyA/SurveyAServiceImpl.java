package com.project.erp.surveyA;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("surveyAService")
public class SurveyAServiceImpl implements SurveyAService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private SurveyADao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(SurveyA a) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyADao.class);
		dao.insert(a);
	}

	@Override
	public SurveyA getBySnum(int snum) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyADao.class);
		return dao.selectBySnum(snum);
	}

	@Override
	public ArrayList<SurveyA> getByParent(int parent) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyADao.class);
		return dao.selectByParent(parent);
	}

	@Override
	public ArrayList<SurveyA> getByQnum(int qnum_multiple) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyADao.class);
		return dao.selectByQnum(qnum_multiple);
	}

	@Override
	public ArrayList<SurveyA> getByMnum(int mnum) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyADao.class);
		return dao.selectByMnum(mnum);
	}

	@Override
	public ArrayList<SurveyA> getAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyADao.class);
		return dao.selectAll();
	}

}
