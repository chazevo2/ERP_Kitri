package com.project.erp.docs;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("docService")
public class ServiceImpl implements Service {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addDocument(Document d) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(d);
	}

	@Override
	public Document getDocument(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.select(num);
	}

	@Override
	public ArrayList<Document> getAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}

	@Override
	public void editDocument(Document d) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.update(d);
	}

	@Override
	public void delDocument(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(num);
	}

}
