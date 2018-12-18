package com.project.erp.surveyQ;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("surveyQService")
public class SurveyQServiceImpl implements SurveyQService {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private SurveyQDao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(SurveyQ q) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		dao.insert(q);
	}
	
	@Override
	public void addS(SurveyQ q) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		dao.insertS(q);
	}
	
	@Override
	public void addQ(SurveyQ q) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		dao.insertQ(q);
	}
	
	@Override
	public void addM(SurveyQ q) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		dao.insertM(q);
	}
	

	@Override
	public void edit(SurveyQ q) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		dao.update(q);
	}

	@Override
	public void delete(int snum) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		dao.delete(snum);
	}

	@Override
	public SurveyQ selectBySnum(int snum) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		return dao.selectBySnum(snum);
	}

	@Override
	public ArrayList<SurveyQ> getByParent(int parent) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		return dao.selectByParent(parent);
	}

	@Override
	public ArrayList<SurveyQ> getByTitle(String title) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		return dao.selectByTitle(title);
	}

	@Override
	public ArrayList<SurveyQ> getByProgress(String progress) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		return dao.selectByProgress(progress);
	}

	@Override
	public ArrayList<SurveyQ> getAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(SurveyQDao.class);
		return dao.selectAll();
	}

}
