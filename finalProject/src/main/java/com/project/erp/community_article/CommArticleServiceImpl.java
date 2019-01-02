package com.project.erp.community_article;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("commarticleservice")
public class CommArticleServiceImpl implements CommArticleService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private CommArticleDao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void add(Community_Article ca) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommArticleDao.class);
		dao.insert(ca);
	}

	@Override
	public void edit(Community_Article ca) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommArticleDao.class);
		dao.update(ca);
	}

	@Override
	public void del(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommArticleDao.class);
		dao.delete(num);
	}

	@Override
	public ArrayList<Community_Article> getByCommNum(int comm_num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommArticleDao.class);
		return dao.selectByCommNum(comm_num);
	}

	@Override
	public ArrayList<Community_Article> getAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(CommArticleDao.class);
		return dao.selectAll();
	}

}
